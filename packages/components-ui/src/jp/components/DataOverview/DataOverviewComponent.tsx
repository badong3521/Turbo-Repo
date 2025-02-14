"use client";

import { ArrowLeft, ArrowRight } from "lucide-react";
import { getAbsoluteImageURL } from "../../helpFc/index";
import { useState } from "react";
import Image from "next/image";
import type { TypeJpRecruiterOverview } from "@di/orm-util" with { "resolution-mode": "import" };
import { Button as JpButton } from "../Button/ButtonComponent";

interface Props {
  images: TypeJpRecruiterOverview[];
}

export const DataOverviewComponent: React.FC<Props> = ({ images }) => {
  const [currentIndex, setCurrentIndex] = useState(0);

  const handlePrev = () => {
    if (images.length === 0) return;
    setCurrentIndex((prevIndex) =>
      prevIndex === 0 ? images.length - 1 : prevIndex - 1,
    );
  };

  const handleNext = () => {
    if (images.length === 0) return;
    setCurrentIndex((prevIndex) =>
      prevIndex === images.length - 1 ? 0 : prevIndex + 1,
    );
  };
  return (
    <div className="di-relative di-pb-36 di-mx-8 md:di-mx-24 di-font-mplus1">
      <div className="di-flex di-items-center di-flex-col">
        <div className="di-text-center di-text-[48px] sm:di-text-[64px] lg:di-text-[56px] di-font-bold di-text-blue-700">
          データで見る データインパクト
        </div>
        <div className="di-font-bold di-text-[24px] di-text-gray-700 di-mt-20 di-max-w-[600px] di-text-center">
          データインパクトってどんな会社？社員と仕事にまつわるいろいろなデータを集めました。
        </div>
      </div>

      <div className="di-relative di-mt-14 di-rounded-xl di-border di-border-gray-300 di-bg-white">
        <div className="di-overflow-hidden">
          <div
            className="di-flex di-transition-transform di-duration-500 di-ease-in-out"
            style={{
              transform:
                currentIndex >= 0 && currentIndex < images.length
                  ? `translateX(-${currentIndex * 100}%)`
                  : "none",
            }}
          >
            {images.length > 0 &&
              images.map((item) => (
                <div
                  key={item.id}
                  className="di-w-full sm:di-h-[500px] di-h-[300px] di-flex-shrink-0 di-flex di-items-center di-p-12 di-justify-center"
                >
                  <Image
                    src={getAbsoluteImageURL(item.directus_files.filename_disk)}
                    alt={item.alt || "Image"}
                    className="di-object-cover di-w-full di-h-full"
                    width={1160}
                    height={300}
                    loading="lazy"
                  />
                </div>
              ))}
          </div>
        </div>

        <div className="di-hidden di-absolute di-top-1/2 di-left-0 di-right-0 sm:di-flex di-w-full di-justify-between di-items-center">
          <JpButton
            onClick={handlePrev}
            Icon={ArrowLeft}
            className="di-absolute di-left-[-24px]"
          />
          <JpButton
            onClick={handleNext}
            Icon={ArrowRight}
            className="di-absolute di-right-[-24px]"
          />
        </div>
      </div>

      <div className="di-absolute di-bottom-28 di-left-1/2 di-transform di--translate-x-1/2 di-flex di-gap-1">
        {images.map((item, index) => (
          <button
            key={item.id}
            type="button"
            onClick={() => {
              setCurrentIndex(index);
            }}
            className={`di-w-7 di-h-2 di-rounded-full ${
              currentIndex === index
                ? "di-bg-blue-500"
                : "di-bg-gray-700 di-opacity-20"
            }`}
          />
        ))}
      </div>
    </div>
  );
};
