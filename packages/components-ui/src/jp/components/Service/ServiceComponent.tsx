/* eslint-disable @typescript-eslint/no-unsafe-assignment */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
import Image from "next/image";
import Button from "../../ui/Button";
import { ArrowRight } from "lucide-react";
import type { TypeJpServices } from "@di/orm-util" with { "resolution-mode": "import" };
import { getAbsoluteImageURL } from "../../helpFc";
import Link from "next/link";

interface ServiceProps {
  servicesData: TypeJpServices[];
}

export function ServiceComponent({ servicesData }: ServiceProps) {
  return (
    <div className="di-flex di-flex-col sm:di-gap-[50px] di-gap-10">
      {servicesData.map((item: TypeJpServices) => (
        <div
          className={`${item.reverse ? "sm:di-flex-row-reverse" : "sm:di-flex-row"} di-flex di-w-full di-flex-col di-items-start di-justify-between di-gap-4 lg:di-gap-8`}
          key={item.id || ""}
        >
          <div className="sm:di-w-1/2 di-w-full scale-img di-rounded-xl md:di-rounded-3xl">
            <Image
              src={getAbsoluteImageURL(item.directus_files.filename_disk)}
              alt="Image service"
              className="di-w-full scale-item-img"
              width={100}
              height={480}
            />
          </div>
          <div className="sm:di-w-1/2 di-w-full di-justify-between di-flex di-flex-wrap">
            <p className="di-font-bold sm:di-text-[32px] di-py-2 sm:di-p-0 di-text-3xl">
              {item.title}
            </p>
            <p className="di-text-[12px] lg:di-text-xl di-mt-3 lg:di-mt-8">
              {item.content}
            </p>
            <Link href={item.links.url || "#"}>
              <Button
                variant="navigation"
                Icon={ArrowRight}
                className="di-mt-2 sm:di-mt-4 xl:di-mt-6"
              >
                <p className="font-mplus di-text-[16px] di-font-bold">
                  詳しく見る
                </p>
              </Button>
            </Link>
          </div>
        </div>
      ))}
    </div>
  );
}
