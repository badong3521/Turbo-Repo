"use client";

import { getAbsoluteImageURL } from "@di/components-ui";
import type { TypeJpNews } from "@di/orm-util";
import Image from "next/image";
import { useState } from "react";

function NewsBanner({ listNews }: { listNews: TypeJpNews[] }) {
  const [loading, setLoading] = useState<boolean[]>([true, true, true]);

  const handleLoadingComplete = (index: number) => {
    setLoading((prev) => {
      const updated = [...prev];
      updated[index] = false;
      return updated;
    });
  };

  return (
    <div className="di-flex">
      {listNews.slice(0, 3).map((news, index) => (
        <div
          key={news.id || index}
          className={`${
            index === 0
              ? "di-flex-1 di-h-full di-w-full"
              : "di-basis-1/4 di-hidden lg:di-block"
          } di-relative`}
        >
          {loading[index] ? (
            <div className="di-absolute di-inset-0 di-bg-gray-300 di-animate-pulse" />
          ) : null}
          <Image
            alt={news.title || "Image"}
            src={getAbsoluteImageURL(news.directus_files.filename_disk || "")}
            width={index === 0 ? 360 : undefined}
            height={index === 0 ? 587 : undefined}
            fill={index !== 0}
            style={{ objectFit: "cover" }}
            className={`${
              index === 0 ? "lg:di-h-[587px] di-h-[744px]" : "di-h-[587px]"
            } di-w-full ${loading[index] ? "di-opacity-0" : "di-opacity-100"} di-transition-opacity`}
            onLoadingComplete={() => {
              handleLoadingComplete(index);
            }}
          />
          <div className="di-absolute di-bottom-10 di-left-6 md:di-left-16 di-right-6 md:di-right-16 di-text-white di-pl-6 di-border-l-2">
            <p className="di-font-medium di-text-xl">CIO/開発</p>
            <p className="di-font-bold di-text-2xl md:di-text-[32px] di-mt-3">
              {news.title}
            </p>
          </div>
        </div>
      ))}
    </div>
  );
}

export default NewsBanner;
