"use client";

import { useForm, Controller } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import * as yup from "yup";
import Image from "next/image";
import { JpButton } from "@di/components-ui";
import { sendEmail } from "@/api/_data";
import type { SendEmailBody } from "@/api/type/send-mail";
import {
  DocumentTypeEnum,
  ReasonToKnowEnum,
  InquiryTypeEnum,
} from "@/api/type/send-mail";
import { useState } from "react";
import Link from "next/link";

const schema = yup.object().shape({
  subject: yup.string().required("件名は必須です"),
  name: yup.string().required("名前は必須です"),
  company: yup.string().required("会社名は必須です"),
  department: yup.string().required("部署は必須です"),
  phone: yup.string().required("電話番号は必須です"),
  email: yup
    .string()
    .email("メールアドレスが無効です")
    .required("メールアドレスは必須です"),
  reasonToKnow: yup
    .mixed<keyof typeof ReasonToKnowEnum>()
    .oneOf(Object.keys(ReasonToKnowEnum) as (keyof typeof ReasonToKnowEnum)[])
    .required("知る理由は必須です"),
  inquiryDetails: yup
    .string()
    .required("お問い合わせの詳細は必須です。最低3文字、最大100文字です")
    .min(10)
    .max(100),
  rubyCharacter: yup.string().nullable(),
  inquiryType: yup
    .mixed<keyof typeof InquiryTypeEnum>()
    .oneOf(Object.keys(InquiryTypeEnum) as (keyof typeof InquiryTypeEnum)[])
    .nullable(),
  documentType: yup
    .mixed<keyof typeof DocumentTypeEnum>()
    .oneOf(Object.keys(DocumentTypeEnum) as (keyof typeof DocumentTypeEnum)[])
    .nullable(),
});

export default function Page() {
  const [loadingSendmail, setLoadingSendmail] = useState<boolean>(false);

  const {
    control,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm<SendEmailBody>({
    resolver: yupResolver(schema),
  });

  const onSubmit = async (data: SendEmailBody) => {
    setLoadingSendmail(true);
    try {
      const result = await sendEmail(data);
      alert(result.message);
      reset();
    } catch (error) {
      alert(`Failed to send email: ${error}`);
    }
    setLoadingSendmail(false);
  };

  return (
    <div className="di-font-mplus1">
      <div className="di-relative di-w-full">
        <Image
          loading="lazy"
          width={1920}
          height={850}
          className="di-object-cover di-w-full di-min-h-[260px]"
          src="./image-1.png"
          alt="About-Us"
          key={1}
        />
        <div className="di-absolute di-inset-0 di-flex di-items-center di-justify-center di-text-black di-text-[40px] sm:di-text-[56px] lg:di-text-[80px] xl:di-text-[96px]">
          お問い合わせ
        </div>
      </div>
      <div className="di-mx-8 di-text-center">
        <div className="di-text-main-blue di-text-[64px] di-my-10 di-font-bold">
          基本情報
        </div>
        <div className="di-mb-4">
          <Link
            href="/contact"
            className="di-font-bold di-text-2xl hover:di-text-main-blue"
          >
            資料請求ページはこちら
          </Link>
        </div>
        <div className="di-font-bold di-text-2xl di-mb-14">
          フリーランス募集のお問い合わせページはこちら
        </div>
        <div className="di-text-[#57595B] di-mb-10">
          <div>お問い合わせについては、下記よりお申込みください。</div>
          <div>受付後、当社よりご連絡させていただきます。</div>
          <div>
            お問い合わせいただいた内容によってはご返信までお時間がかかる場合や、
          </div>
          <div>ご返信できない場合がございますので予めご了承ください。</div>
        </div>
      </div>
      <div className="di-flex di-justify-center di-w-full di-flex-wrap sm:di-flex-nowrap di-gap-4 xl:di-px-12 di-px-4 di-mb-14">
        <form className="di-w-full" onSubmit={handleSubmit(onSubmit)}>
          <div className="di-grid di-grid-cols-1 lg:di-grid-cols-2 di-gap-6">
            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                お問い合わせ種目 <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="subject"
                control={control}
                defaultValue="お問い合わせ"
                render={({ field }) => <></>}
              />
              {errors.subject ? (
                <p className="di-text-red-500">{errors.subject.message}</p>
              ) : null}
              <Controller
                name="inquiryType"
                control={control}
                render={({ field }) => (
                  <select
                    required
                    {...field}
                    value={field.value ?? ""}
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-4 di-w-full text-gray-400"
                  >
                    <option value="" disabled hidden>
                      選択して下さい
                    </option>
                    {Object.entries(InquiryTypeEnum).map(([key, value]) => (
                      <option key={key} value={key} className="text-black">
                        {value}
                      </option>
                    ))}
                  </select>
                )}
              />
              {errors.inquiryType ? (
                <p className="di-text-red-500">{errors.inquiryType.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                電話番号
              </div>
              <Controller
                name="phone"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    value={field.value ?? ""}
                    type="text"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.phone ? (
                <p className="di-text-red-500">{errors.phone.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                お名前 <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="name"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    type="text"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.name ? (
                <p className="di-text-red-500">{errors.name.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                Email <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="email"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    type="email"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.email ? (
                <p className="di-text-red-500">{errors.email.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                フリガナ
              </div>
              <Controller
                name="rubyCharacter"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    value={field.value ?? ""}
                    type="text"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.rubyCharacter ? (
                <p className="di-text-red-500">
                  {errors.rubyCharacter.message}
                </p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                DATA IMPACT を 知ったきっかけ
                <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="reasonToKnow"
                control={control}
                defaultValue="FoundByChance"
                render={({ field }) => (
                  <select
                    {...field}
                    value={field.value ?? "FoundByChance"}
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  >
                    {Object.entries(ReasonToKnowEnum).map(([key, value]) => (
                      <option key={key} value={key}>
                        {value}
                      </option>
                    ))}
                  </select>
                )}
              />
              {errors.reasonToKnow ? (
                <p className="di-text-red-500">{errors.reasonToKnow.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                法人名 <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="company"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    type="text"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.company ? (
                <p className="di-text-red-500">{errors.company.message}</p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col di-row-span-2">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                お問い合わせ内容 <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="inquiryDetails"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <textarea
                    {...field}
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full di-h-full di-min-h-40"
                  />
                )}
              />
              {errors.inquiryDetails ? (
                <p className="di-text-red-500">
                  お問い合わせの詳細は必須です。最低3文字、最大100文字です
                </p>
              ) : null}
            </div>

            <div className="di-flex di-flex-col">
              <div className="di-font-bold di-mb-4 di-text-[24px] lg:di-text-[32px]">
                部署・役職 <span className="di-text-red-500">*</span>
              </div>
              <Controller
                name="department"
                control={control}
                defaultValue=""
                render={({ field }) => (
                  <input
                    {...field}
                    type="text"
                    className="di-border di-border-gray-300 di-rounded-md di-px-2 di-py-8 di-w-full"
                  />
                )}
              />
              {errors.department ? (
                <p className="di-text-red-500">{errors.department.message}</p>
              ) : null}
            </div>
          </div>

          <div className="di-flex di-justify-center di-my-10 di-mx-4">
            <JpButton
              disabled={loadingSendmail}
              type="submit"
              variant="default"
              className="di-w-[340px] di-h-16 di-rounded-[31px]"
            >
              <p className="font-mplus di-text-[16px] di-font-bold di-pr-4">
                送信
              </p>
            </JpButton>
          </div>
        </form>
      </div>
    </div>
  );
}
