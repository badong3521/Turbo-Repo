export enum ReasonToKnowEnum {
  FoundByChance = "検索エンジンで偶然見つけた",
  Articles = "記事などで知った",
  SocialMedia = "SNSやブログ、Youtubeなどで知った",
  Others = "その他",
}

// survey
export enum InquiryTypeEnum {
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

// contact
export enum DocumentTypeEnum {
  CompanyProfile = "会社案内資料",
  SystemDevelopment = "システム開発についての資料",
  DataScience = "データサイエンスについての資料",
  AIImageRecognition = "AI・画像認識についての資料",
}

export interface SendEmailBody {
  subject: string; // title page
  name: string; // お名前 *
  company: string; // 法人名 *
  department: string; // 部署・役職 *
  phone: string; // 電話番号
  email: string; // Email
  reasonToKnow: keyof typeof ReasonToKnowEnum; // 理由
  inquiryDetails: string; // お問い合わせ内容 *
  rubyCharacter?: string | null; // フリガナ *
  inquiryType?: keyof typeof InquiryTypeEnum | null; // 問い合わせタイプ
  documentType?: keyof typeof DocumentTypeEnum | null; // ドキュメントタイプ
}
