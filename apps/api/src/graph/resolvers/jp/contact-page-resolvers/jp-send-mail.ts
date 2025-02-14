import { dbClient } from "@di/orm-util";
import { GraphQLError } from "graphql";

enum ReasonToKnowEnum {
  FoundByChance = "検索エンジンで偶然見つけた",
  Articles = "記事などで知った",
  SocialMedia = "SNSやブログ、Youtubeなどで知った",
  Others = "その他",
}

enum InquiryTypeEnum {
  Business = "弊社事業に関するお問い合わせ",
  DXConsulting = "DXコンサルティングに関するお問い合わせ",
  DataAI = "データ活用・AI導入のご相談",
  LegacyCodeConversion = "レガシーコード変換に関するお問い合わせ",
  BusinessAutomation = "業務効率化・自動化のご相談",
  WebDevelopment = "Webシステム・アプリ開発のご相談",
  SystemDevelopment = "各種システム開発のご相談",
  MediaCoverage = "メディア掲載・取材のお問い合わせ",
  Partnership = "パートナーシップ・協業に関するお問い合わせ",
}

enum DocumentTypeEnum {
  CompanyProfile = "会社案内資料",
  SystemDevelopment = "システム開発についての資料",
  DataScience = "データサイエンスについての資料",
  AIImageRecognition = "AI・画像認識についての資料",
}

export interface SendEmailArgs {
  subject: string;
  inquiryType: InquiryTypeEnum;
  documentType: DocumentTypeEnum;
  name: string;
  rubyCharacter: string;
  company: string;
  department: string;
  phone?: string;
  email: string;
  reasonToKnow: ReasonToKnowEnum;
  inquiryDetails: string;
}

export const errorName = {
  BAD_REQUEST: "BAD_REQUEST",
  SERVER_ERROR: "SERVER_ERROR",
};

export const errorType = {
  BAD_REQUEST: {
    INVALID_LENGTH: {
      message: "inquiryDetails must be in range 10 to 100.",
      statusCode: 400,
    },
    EXCLUSIVE_FIELD_REQUIRED: {
      message: "Only exist inquiryType or documentType.",
      statusCode: 400,
    },
  },
  SERVER_ERROR: {
    message: "Internal server error.",
    statusCode: 500,
  },
};

export async function postSendMail(input: SendEmailArgs) {
  const {
    subject,
    inquiryType,
    documentType,
    name,
    rubyCharacter,
    company,
    department,
    phone,
    email,
    reasonToKnow,
    inquiryDetails,
  } = input;

  try {
    if (Boolean(inquiryType) === Boolean(documentType)) {
      throw new GraphQLError(
        errorType.BAD_REQUEST.EXCLUSIVE_FIELD_REQUIRED.message,
        {
          extensions: {
            code: errorName.BAD_REQUEST,
            statusCode:
              errorType.BAD_REQUEST.EXCLUSIVE_FIELD_REQUIRED.statusCode,
          },
        },
      );
    }

    if (inquiryDetails.length < 10 || inquiryDetails.length > 100) {
      throw new GraphQLError(errorType.BAD_REQUEST.INVALID_LENGTH.message, {
        extensions: {
          code: errorName.BAD_REQUEST,
          statusCode: errorType.BAD_REQUEST.INVALID_LENGTH.statusCode,
        },
      });
    }

    await dbClient.jp_contact_email.create({
      data: {
        subject,
        inquiry_type: inquiryType,
        document_type: documentType,
        name,
        ruby_character: rubyCharacter,
        company,
        department,
        phone,
        email,
        reason_to_know: reasonToKnow,
        inquiry_details: inquiryDetails,
      },
    });

    const params = new URLSearchParams({
      client_id: process.env.CLIENT_ID || "",
      client_secret: process.env.CLIENT_SECRET || "",
      grant_type: "client_credentials",
      scope: "https://graph.microsoft.com/.default",
    });
    const tokenResponse = await fetch(
      `https://login.microsoftonline.com/${process.env.TENANT_ID}/oauth2/v2.0/token`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: params.toString(),
      },
    );
    const { access_token: accessToken } = await tokenResponse.json();

    const url = `https://graph.microsoft.com/v1.0/users/${email}/sendMail`;

    const content = generateEmailContent(input);

    const emailData = {
      message: {
        subject,
        body: {
          contentType: "HTML",
          content,
        },
        toRecipients: [{ emailAddress: { address: process.env.USER_EMAIL } }],
      },
    };

    await fetch(url, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${accessToken}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(emailData),
    });
    return { message: "Email sent successfully" };
  } catch (error: any) {
    console.error("error: ", error);
    if (error instanceof GraphQLError) {
      throw error;
    }

    throw new GraphQLError(errorType.SERVER_ERROR.message, {
      extensions: {
        code: errorName.SERVER_ERROR,
        statusCode: errorType.SERVER_ERROR.statusCode,
      },
    });
  }
}

function generateEmailContent(args: SendEmailArgs) {
  const inquiryTypeValue =
    Object.entries(InquiryTypeEnum).find(
      ([key, _]) => key === args.inquiryType,
    )?.[1] ?? "Unknown";
  const documentTypeValue =
    Object.entries(DocumentTypeEnum).find(
      ([key, _]) => key === args.documentType,
    )?.[1] ?? "Unknown";
  const reasonToKnowValue =
    Object.entries(ReasonToKnowEnum).find(
      ([key, _]) => key === args.reasonToKnow,
    )?.[1] ?? "Unknown";

  return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Email Content</title>
    </head>
    <body>
        <h2>${args.subject}</h2>

        ${
          args.inquiryType
            ? `<p><strong>お問い合わせ種目:</strong> ${inquiryTypeValue}</p>`
            : `<p><strong>ご希望の資料:</strong> ${documentTypeValue}</p>`
        }

        <p><strong>お名前:</strong> ${args.name}</p>
        <p><strong>フリガナ:</strong> ${args.rubyCharacter}</p>
        <p><strong>法人名:</strong> ${args.company}</p>
        <p><strong>部署・役職:</strong> ${args.department}</p>
        <p><strong>電話番号:</strong> ${args.phone || "N/A"}</p>
        <p><strong>Email:</strong> ${args.email}</p>
        <p><strong>DATA IMPACT を 知ったきっかけ:</strong> ${reasonToKnowValue}</p>
        <p><strong>お問い合わせ内容:</strong> ${args.inquiryDetails}</p>
    </body>
    </html>
  `;
}
