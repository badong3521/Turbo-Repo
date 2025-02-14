/* eslint-disable @typescript-eslint/no-unsafe-argument */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import Image from "next/image";
import Marquee from "react-fast-marquee";
import React from "react";
import { getAbsoluteImageURL, TitleComponent } from "@di/components-ui";
import type { TypeJpMarquee } from "@di/orm-util" with { "resolution-mode": "import" };
interface MarqueeComponentProps {
  title: string;
  images: TypeJpMarquee[];
  speed?: number;
  gradient?: boolean;
}

export const MarqueeComponent: React.FC<MarqueeComponentProps> = ({
  title,
  images,
  speed = 100,
  gradient = true,
}) => {
  return (
    <div className="lg:di-mb-20 sm:di-mb-10">
      <div className="sm:di-mt-10 lg:di-mt-16 di-flex di-items-center di-justify-center">
        <TitleComponent title={title} />
      </div>
      <Marquee speed={speed} gradient={gradient} pauseOnHover>
        <div className="di-flex sm:di-gap-8 di-gap-4 sm:di-py-12 di-py-5">
          {images.map((image) => (
            <Image
              width={271}
              height={80}
              key={image.id}
              alt={image.alt || "Image"}
              src={getAbsoluteImageURL(image.directus_files.filename_disk)}
            />
          ))}
        </div>
      </Marquee>
    </div>
  );
};
