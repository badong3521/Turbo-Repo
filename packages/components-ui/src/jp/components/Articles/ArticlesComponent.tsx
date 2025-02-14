import { getAbsoluteImageURL } from "@di/components-ui";
import type { TypeJpAboutArticles } from "@di/orm-util" with { "resolution-mode": "import" };

import Image from "next/image";
interface CompanyComponentProps {
  articles: TypeJpAboutArticles[];
}
export const ArticlesComponent: React.FC<CompanyComponentProps> = ({
  articles,
}) => {
  return (
    <div className="di-font-mplus1 di-flex di-flex-col sm:di-gap-12 sm:di-mt-12">
      {articles.map((article) => (
        <div
          key={article.id}
          className={`di-flex di-flex-col sm:di-gap-16 di-gap-4 ${
            article.reverse ? "sm:di-flex-row-reverse" : "sm:di-flex-row"
          }`}
        >
          <div className="di-flex di-flex-col di-justify-center di-items-center sm:di-items-start di-flex-1 di-gap-6">
            <div className="di-text-[32px] lg:di-text-[40px] di-mt-7 lg:di-my-0 di-font-bold">
              {article.title}
            </div>
            <div className="di-text-[16px] lg:di-text-[20px] di-whitespace-pre-line">
              {article.description}
            </div>
          </div>

          <div className="di-flex-1 di-flex di-items-center di-w-full scale-img sm:di-rounded-3xl">
            <Image
              loading="lazy"
              width={856}
              height={676}
              className="di-object-cover di-h-full di-w-full scale-item-img"
              src={getAbsoluteImageURL(article.directus_files.filename_disk)}
              alt={article.title || ""}
            />
          </div>
        </div>
      ))}
    </div>
  );
};
