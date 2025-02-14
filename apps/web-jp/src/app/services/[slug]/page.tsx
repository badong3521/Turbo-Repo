import Image from "next/image";
import type { TypeJpWorkList } from "@di/orm-util";
import { getAbsoluteImageURL, TitleComponent } from "@di/components-ui";
import {
  getAllJpWorkList,
  getAllServicePosts,
  getServicePostBySlug,
} from "@/api/_data";
import Link from "next/link";
import SpinnerLoading from "@/components/ui/SpinnerLoading";
import REVALIDATE_TIME from "@/lib/revalidate";

interface ServiceProps {
  params: {
    slug: string;
  };
}

export const revalidate = REVALIDATE_TIME;

export async function generateStaticParams() {
  const servicePosts = await getAllServicePosts();

  return servicePosts.map((post) => ({
    slug: post.slug,
  }));
}

export default async function ServicePostPage({ params }: ServiceProps) {
  const { slug } = params;

  const [servicePost, workList] = await Promise.all([
    getServicePostBySlug(slug),
    getAllJpWorkList(),
  ]);

  if (!servicePost) {
    return <SpinnerLoading />;
  }

  return (
    <div className="di-font-mplus1">
      <div className="di-relative di-w-full">
        <Image
          loading="lazy"
          width={1920}
          height={850}
          className="di-object-cover di-w-full di-min-h-[260px]"
          src=".././image-1.png"
          alt="Services"
        />
        <div className="di-absolute di-inset-0 di-flex di-items-center di-justify-center di-text-black di-text-[40px] sm:di-text-[56px] lg:di-text-[80px] xl:di-text-[96px]">
          {servicePost.title}
        </div>
      </div>

      <div className="di-flex di-flex-wrap di-justify-around di-p-4 di-bg-gray-200 di-sticky di-top-24 di-z-40">
        {servicePost.services_post_detail.map((post) => (
          <a
            href={`#post-${post.id}`}
            className="di-text-xs md:di-text-2xl di-cursor-pointer"
            key={post.id}
          >
            {post.title}
          </a>
        ))}
      </div>
      <div className="xl:di-mx-16 lg:di-mx-8 sm:di-mx-6 di-mx-3">
        <div className="di-font-mplus1 di-flex di-flex-col sm:di-gap-12 di-gap-4 di-my-8">
          {servicePost.services_post_detail.map((post) => (
            <div
              id={`post-${post.id}`}
              key={post.id}
              className={`di-flex di-bg-white di-p-4 sm:di-p-8 di-rounded-3xl di-flex-col xl:di-gap-16 lg:di-gap-8 di-gap-4 di-border di-border-gray-300 ${
                post.reverse ? "lg:di-flex-row-reverse" : "lg:di-flex-row"
              }`}
            >
              <div className="di-flex-1 di-flex di-items-center di-w-full scale-img sm:di-rounded-3xl">
                <Image
                  loading="lazy"
                  width={856}
                  height={676}
                  className="di-object-cover di-h-full di-w-full scale-item-img"
                  src={getAbsoluteImageURL(post.directus_files.filename_disk)}
                  alt={post.title || ""}
                />
              </div>
              <div className="di-flex di-flex-col di-justify-center di-items-start di-flex-1 di-gap-6">
                <div className="di-text-[32px] xl:di-text-[40px] lg:di-text-[36px] di-mt-7 lg:di-my-0 di-font-bold">
                  {post.title}
                </div>
                <div className="di-text-[16px] xl:di-text-[20px] di-whitespace-pre-line">
                  {post.description}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
      <div className="di-flex di-flex-col di-justify-center di-items-center lg:di-my-12 di-bg-white">
        <div className="lg:di-my-8 di-my-4">
          <TitleComponent title="サービス" />
        </div>

        <div className="lg:di-p-12 di-p-4 di-mx-auto di-grid di-grid-cols-1 di-gap-x-8 md:di-gap-y-8 di-gap-y-6 lg:di-mx-0 sm:di-grid-cols-2 lg:di-grid-cols-3 xl:di-grid-cols-4 di-w-full">
          {workList.map((item: TypeJpWorkList) => (
            <Link
              key={item.id}
              href="#"
              className="di-flex di-max-w-xl di-flex-col di-items-start di-justify-between di-border-2 di-rounded-3xl di-transition-shadow di-duration-300 di-ease-in-out hover:di-shadow-md di-h-full"
            >
              <Image
                src={getAbsoluteImageURL(item.directus_files.filename_disk)}
                alt="123"
                width={446}
                height={338}
                className="di-bg-cover di-w-full di-bg-center di-rounded-t-[22px] di-rounded-b-none"
              />
              <div className="di-p-4 di-w-full di-flex-1 di-flex di-flex-col di-font-bold">
                <h3 className="di-text-2xl di-text-blue-500 di-mt-4">
                  {item.title}
                </h3>
                <p className="di-mt-4 di-text-xl">{item.description}</p>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
