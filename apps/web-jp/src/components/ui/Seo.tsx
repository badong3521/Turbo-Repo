import Head from "next/head";

export default function Seo() {
  const websiteUrl =
    process.env.NEXT_PUBLIC_WEBSITE_URL || "https://jp.dataimpact.vn";

  return (
    <Head>
      {/* SEOの基本メタタグ */}
      <title>Data Impact - あなたの意志を強化する</title>
      <meta
        name="description"
        content="Data Impactは、AIoTの先進的なソリューションを提供し、企業のパフォーマンス向上と持続可能な発展を支援します。"
      />
      <meta charSet="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta
        name="keywords"
        content="AIoT, 人工知能, モノのインターネット, テクノロジーソリューション, Data Impact"
      />
      <meta name="author" content="Data Impact" />

      {/* Open Graph メタタグ（SNS共有用） */}
      <meta
        property="og:title"
        content="Data Impact - あなたの意志を強化する"
      />
      <meta
        property="og:description"
        content="AIoTソリューションを活用し、企業の業務最適化と生産性向上を実現します。"
      />
      <meta property="og:type" content="website" />
      <meta property="og:url" content={websiteUrl} />
      <meta
        property="og:image"
        content="https://dataimpact.vn/images/logo-no-title.png"
      />

      {/* Twitter メタタグ */}
      <meta
        name="twitter:title"
        content="Data Impact - あなたの意志を強化する"
      />
      <meta
        name="twitter:description"
        content="Data ImpactはAIoT分野のリーディングカンパニーであり、企業向けのスマートソリューションを提供します。"
      />
      <meta
        name="twitter:image"
        content="https://dataimpact.vn/images/logo-no-title.png"
      />
      <meta name="twitter:card" content="summary_large_image" />

      {/* JSON-LD 構造化データ */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify({
            "@context": "https://schema.org",
            "@type": "Organization",
            name: "Data Impact",
            url: websiteUrl,
            logo: "https://dataimpact.vn/images/logo-no-title.png",
            description:
              "Data Impactは、AIoTの先進的なソリューションを提供し、企業のパフォーマンス向上と持続可能な発展を支援します。",
            contactPoint: [
              {
                "@type": "ContactPoint",
                telephone: "+84 123 456 789",
                contactType: "カスタマーサービス",
                areaServed: "JP",
                availableLanguage: "Japanese",
              },
            ],
          }),
        }}
      />
    </Head>
  );
}
