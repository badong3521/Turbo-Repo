"use client";

import { ArrowRight } from "lucide-react";

import Image from "next/image";
import { useState } from "react";
import { getAbsoluteImageURL, JpButton } from "@di/components-ui";
import type { TypeJpCarousel } from "@di/orm-util";
import {
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselNext,
  CarouselPrevious,
  type CarouselApi,
} from "@/components/ui/Carousel";

interface CarouselComponentProps {
  imageCarousel: TypeJpCarousel[];
}

export const CarouselComponent: React.FC<CarouselComponentProps> = ({
  imageCarousel,
}) => {
  const [activeIndex, setActiveIndex] = useState<number>(1);
  const [carouselApi, setCarouselApi] = useState<CarouselApi>();
  return (
    <Carousel
      className="di-max-w-[2560px] di-max-h-screen clip-custom-mobile md:clip-custom"
      opts={{
        containScroll: "trimSnaps",
        loop: true,
      }}
      setApi={(api: CarouselApi) => {
        if (api) {
          setCarouselApi(api);
          api.on("select", () => {
            setActiveIndex(api.selectedScrollSnap() + 1);
          });
        }
      }}
    >
      <CarouselContent>
        {imageCarousel.map((item) => {
          const isCurrentText = getAbsoluteImageURL(
            item.directus_files.filename_disk,
          )
            .toLowerCase()
            .includes("cfa88e35-2afb-4fd8-ab88-f3033b908f6e.webp");
          return (
            <CarouselItem key={item.id}>
              <div className="di-relative lg:di-h-[900px] di-h-[600px]">
                <Image
                  loading="lazy"
                  width={1920}
                  height={850}
                  className="di-w-full di-h-full di-object-cover"
                  src={getAbsoluteImageURL(item.directus_files.filename_disk)}
                  alt={item.alt || ""}
                />
                <div className="di-absolute lg:di-top-[25%] lg:di-left-[10%] md:di-top-[20%] sm:di-top-[10%] di-top-24 di-left-6 di-right-6 sm:di-right-auto lg:di-py-10 xl:di-py-20 sm:di-py-10 di-py-8 di-rounded-3xl">
                  <p
                    className={`${isCurrentText ? "di-from-main-blue di-via-main-gradientB di-to-main-gradientA di-bg-gradient-to-r di-bg-clip-text di-text-transparent" : "di-text-main-white"} di-font-medium lg:di-text-[48px] di-text-[40px] di-max-w-[650px] di-min-w-[400px]`}
                  >
                    2025年の技術トレンド予測 - 人工知能(AI)の未来
                  </p>
                  <JpButton
                    variant="navigation"
                    Icon={ArrowRight}
                    className="di-mt-10"
                  >
                    <p className="font-mplus di-text-[16px] di-font-bold">
                      詳しく見る
                    </p>
                  </JpButton>
                </div>
              </div>
            </CarouselItem>
          );
        })}
      </CarouselContent>
      <div className="di-absolute di-hidden di-top-2/4 lg:di-flex di-w-full di-justify-between di-items-center di-px-16">
        <CarouselPrevious className="di-bg-white-opacity" />
        <CarouselNext className="di-bg-white-opacity" />
      </div>
      <div className="di-absolute di-bottom-40 lg:di-bottom-[100px] lg:di-left-1/2 di-transform lg:di--translate-x-1/2 di-flex di-gap-1 di-left-6">
        {imageCarousel.map((item) => (
          <button
            type="button"
            key={item.id}
            onClick={() => {
              setActiveIndex(item.id);
              carouselApi?.scrollTo(item.id);
            }}
            className={`di-w-7 di-h-2 di-rounded-full di-bg-white ${
              activeIndex === item.id ? "di-bg-white" : "di-opacity-20"
            }`}
          />
        ))}
      </div>
    </Carousel>
  );
};
