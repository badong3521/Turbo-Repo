import {
  ArticlesComponent,
  CompanyComponent,
  TitleComponent,
} from "@di/components-ui";
import Image from "next/image";
import { getAllJpAboutArticles, getAllJpAboutCompany } from "@/api/_data";

export default async function Page() {
  const [company, articles] = await Promise.all([
    getAllJpAboutCompany(),
    getAllJpAboutArticles(),
  ]);
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
        />
        <div className="di-absolute di-inset-0 di-flex di-items-center di-justify-center di-text-black di-text-[40px]  sm:di-text-[56px] lg:di-text-[80px] xl:di-text-[96px]">
          会社情報
        </div>
      </div>
      <div className="xl:di-mx-16 lg:di-mx-8 sm:di-mx-6 di-mx-3">
        <ArticlesComponent articles={articles} />
        <div className="di-flex di-flex-col di-justify-center di-items-center di-my-12 di-bg-white di-p-4 di-rounded-lg di-shadow-md">
          <div className="sm:di-my-12 lg:di-my-20 di-my-6">
            <TitleComponent title="基本情報" />
          </div>
          <CompanyComponent company={company} />
        </div>
      </div>
    </div>
  );
}
