/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/no-unsafe-argument */
import Image from "next/image";
import {
  getAbsoluteImageURL,
  ImageHoverComponent,
  TitleComponent,
} from "@di/components-ui";
import type { TypeJpAbout } from "@di/orm-util";
interface AboutComponentProps {
  aboutData: TypeJpAbout[];
}
export const AboutComponent: React.FC<AboutComponentProps> = ({
  aboutData,
}) => {
  return (
    <div>
      <div className="di-flex sm:di-flex-row di-flex-col di-mt-10 di-gap-4 di-w-full">
        <div className="di-basis-1/2">
          <div className="di-flex di-flex-col lg:di-flex-row lg:di-items-center di-items-start">
            <TitleComponent title="私たちについて" />
            <div className="di-w-16 lg:di-h-[5px] di-h-[2px] di-bg-main-blue lg:di-bg-black di-mt-2 lg:di-ml-5" />
          </div>
          <div className="di-flex di-flex-wrap lg:di-gap-5 di-gap-2 di-flex-col di-mt-2">
            {aboutData[0]?.jp_about_item_text.map((item) => (
              <p
                key={item.id}
                className="di-text-main-black di-text-[12px] lg:di-text-lg"
              >
                {item.title}
              </p>
            ))}
          </div>
        </div>

        <div className="di-basis-1/2 di-flex-row di-flex di-gap-4 di-justify-between di-min-w-96 di-flex-wrap sm:di-flex-nowrap">
          {aboutData[0]?.jp_about_item_image
            .slice(0, 2)
            .map((item) => (
              <ImageHoverComponent
                key={item.id}
                imageSrc={getAbsoluteImageURL(
                  item.directus_files.filename_disk,
                )}
                imageAlt="Image About"
                iconSrc={getAbsoluteImageURL(
                  item
                    .directus_files_jp_about_item_image_icon_srcTodirectus_files
                    .filename_disk,
                )}
                iconAlt="add_rounded"
                mainText={item.main_text || ""}
                hoverText={item.hover_text || ""}
              />
            ))}
        </div>
      </div>
      <div className="di-flex di-mt-4 sm:di-mt-8 di-gap-4 di-flex-col sm:di-flex-row">
        <div className="sm:di-basis-1/2 di-flex-row di-flex di-gap-4 di-justify-between di-min-w-96 di-flex-wrap sm:di-flex-nowrap">
          {aboutData[0]?.jp_about_item_image
            .slice(2, 4)
            .map((item) => (
              <ImageHoverComponent
                key={item.id}
                imageSrc={getAbsoluteImageURL(
                  item.directus_files.filename_disk,
                )}
                imageAlt="Image About"
                iconSrc={getAbsoluteImageURL(
                  item
                    .directus_files_jp_about_item_image_icon_srcTodirectus_files
                    .filename_disk,
                )}
                iconAlt="add_rounded"
                mainText={item.main_text || ""}
                hoverText={item.hover_text || ""}
              />
            ))}
        </div>
        <div className="sm:di-basis-1/2 di-flex-row di-flex di-gap-4 di-justify-between di-flex-wrap sm:di-flex-nowrap">
          <div className="di-w-full scale-img ">
            <Image
              src={getAbsoluteImageURL(
                aboutData[0]?.directus_files.filename_disk,
              )}
              width={880}
              height={480}
              alt="Image service"
              className="di-w-full scale-item-img di-h-full di-object-fill "
            />
          </div>
        </div>
      </div>
    </div>
  );
};
