import {
  getAllJpAbout,
  getAllJpCarousel,
  getAllJpDevelop,
  getAllJpNews,
  getAllJpServices,
  getAllMarquee,
  getAllTechStack,
} from "@/api/_data";
import type { TypeJpMarquee } from "@di/orm-util";
import Image from "next/image";
import { CarouselComponent } from "./home/components/carousel/Carousel";
import {
  MarqueeComponent,
  NewsComponent,
  ServiceComponent,
  TitleComponent,
} from "@di/components-ui";
import { images } from "@/data/_data";
import { AboutComponent } from "./home/components/about/AboutComponent";
import { DevelopComponent } from "./home/components/develop/DevelopComponent";
import { TechStackComponent } from "./home/components/techstack/TechStackComponent";
import REVALIDATE_TIME from "@/lib/revalidate";
import Seo from "@/components/ui/Seo";

export const revalidate = REVALIDATE_TIME;

export default async function Page() {
  const [news, develop, carousel, techstack, marquee, services, about] =
    await Promise.all([
      getAllJpNews(),
      getAllJpDevelop(),
      getAllJpCarousel(),
      getAllTechStack(),
      getAllMarquee(),
      getAllJpServices(),
      getAllJpAbout(),
    ]);

  const transactionMarquee = marquee
    .filter((item: TypeJpMarquee) => item.catetory === "transaction")
    .map((item: TypeJpMarquee) => {
      return item;
    });

  const badgeMarquee = marquee
    .filter((item: TypeJpMarquee) => item.catetory === "badge")
    .map((item: TypeJpMarquee) => {
      return item;
    });

  return (
    <div>
      <Seo />
      <div className="di-absolute di-top-0 di-left-0 di-w-full di-z-[-1]">
        {images.map((src, index) => (
          <Image
            key={index}
            width={2560}
            height={800}
            alt={`background-main-${src}`}
            src={src}
            quality={100}
            sizes="100vw"
            priority
            className="di-object-cover"
          />
        ))}
      </div>
      <div className="di-font-mplus1 di-w-full ">
        <CarouselComponent imageCarousel={carousel} />
        <div
          className="di-fixed di-gap-5 di-bottom-0 di-bg-main-blue -di-right-[200px] di-z-50 di-py-3 di-px-5 di-rounded-l-full di-flex di-items-center di-transform
         di-transition-all di-duration-300 hover:di-translate-x-[-200px] hover:di-pr-5 di-font-medium di-text-2xl di-text-white"
        >
          <Image
            alt="Contact Icon"
            src="./contact.svg"
            width={48}
            height={48}
            className=""
          />
          会議を予約する
        </div>
        <div className="xl:di-mx-16 lg:di-mx-8 sm:di-mx-6 di-mx-3">
          <div className="lg:di-mt-24 di-my-12 lg:di-mb-20 di-flex di-items-center di-justify-center">
            <TitleComponent title="サービス" />
          </div>
          <ServiceComponent servicesData={services} />
          <AboutComponent aboutData={about} />
          <MarqueeComponent
            title="取引実績"
            images={transactionMarquee}
            speed={120}
          />
          <DevelopComponent developData={develop} />
          <TechStackComponent techstackData={techstack} />
          <div className="lg:di-my-16 di-my-4">
            <NewsComponent title="ニュース" newsData={news} />
          </div>
          {/* <div className="di-bg-white-opacity-develop di-shadow di-rounded-lg di-shadow-white">
            <MarqueeComponent
              title="バッジ"
              images={badgeMarquee}
              speed={120}
              gradient={false}
            />
          </div> */}
        </div>
      </div>
    </div>
  );
}
