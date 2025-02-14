"use client";

import { getAllJpNews } from "@/api/_data";
import { getAbsoluteImageURL, JpButton } from "@di/components-ui";
import type { TypeJpNews } from "@di/orm-util";
import { ArrowRight } from "lucide-react";
import Image from "next/image";
import Link from "next/link";
import { useState, useEffect } from "react";
import NewsBanner from "./components/NewsBanner";
import SpinnerLoading from "@/components/ui/SpinnerLoading";

export default function Page() {
  const [listNews, setListNews] = useState<TypeJpNews[]>([]);
  const [selectedTag, setSelectedTag] = useState<string | null>("");
  const [loadingList, setLoadingList] = useState<boolean>(false);

  useEffect(() => {
    async function fetchNews() {
      setLoadingList(true);
      const news = await getAllJpNews();
      setListNews(news);
      setLoadingList(false);
    }
    void fetchNews();
  }, []);

  const uniqueTags = Array.from(
    new Map(
      listNews
        .flatMap((news) => news.tags || [])
        .map((tag) => [typeof tag === "string" ? tag.toLowerCase() : tag, tag]),
    ).values(),
  );

  const filteredNews: TypeJpNews[] = selectedTag
    ? listNews.filter(
        (news) => Array.isArray(news.tags) && news.tags.includes(selectedTag),
      )
    : listNews;

  return (
    <>
      {loadingList ? (
        <SpinnerLoading />
      ) : (
        <div className="di-relative">
          <div className="di-absolute di-top-0 di-left-0 di-w-full di-z-[-1]">
            <Image
              key="/background-main-1.png"
              width={2560}
              height={800}
              alt="/background-main-1.png"
              src="/background-main-1.png"
              quality={100}
              sizes="100vw"
              priority
              className="di-object-cover"
            />
          </div>
          <NewsBanner listNews={listNews} />
          <div className="di-flex di-gap-6 lg:di-px-16 di-my-14">
            <div
              style={{ scrollbarWidth: "none", msOverflowStyle: "none" }}
              className="di-hidden di-sticky di-top-28 di-bg-[#0D1F2A] di-w-[407px] di-text-white di-overflow-y-auto lg:di-flex di-flex-col di-gap-6 di-rounded-3xl di-h-fit"
            >
              <div className="di-px-6 di-py-10 di-flex di-flex-col di-gap-6">
                <p className="di-font-medium di-text-[40px]">カテゴリ</p>
                {uniqueTags.map((tag) => (
                  <button
                    type="button"
                    key={String(tag)}
                    onClick={() => {
                      setSelectedTag(
                        selectedTag === tag ? null : (tag as string),
                      );
                    }}
                    className="di-flex di-flex-col di-gap-6"
                  >
                    <span
                      className={`di-font-bold di-text-xl di-text-[#C5C5C5] di-text-left ${
                        selectedTag === tag ? "di-text-main-white" : ""
                      }
                `}
                    >
                      {String(tag)}
                    </span>
                    <hr className="di-w-full di-border-[#D9D9D9]" />
                  </button>
                ))}
              </div>
            </div>
            <div className="di-flex di-flex-col di-gap-4 di-w-full">
              <div className="di-flex di-w-full di-items-center">
                <hr className="di-flex-1 di-border-black" />
                <span className="di-font-bold di-text-[32px] di-text-main-blue di-mx-8">
                  {selectedTag || "新着"}
                </span>
                <hr className="di-flex-1 di-border-black" />
              </div>
              <div className="di-px-4 di-mx-auto di-grid di-max-w-2xl di-grid-cols-1 di-gap-x-4 md:di-gap-y-8 di-gap-y-6 lg:di-mx-0 lg:di-max-w-none sm:di-grid-cols-2 lg:di-grid-cols-3">
                {filteredNews.map((itemNews) => {
                  return (
                    <Link
                      key={itemNews.id}
                      href={`/news/${itemNews.slug}`}
                      className="di-flex di-max-w-xl di-flex-col di-items-start di-justify-between di-border-2 di-rounded-3xl di-transition-shadow di-duration-300 di-ease-in-out hover:di-shadow-md di-h-full"
                    >
                      <Image
                        alt={`Image ${itemNews.title}`}
                        src={getAbsoluteImageURL(
                          itemNews.directus_files.filename_disk,
                        )}
                        width={446}
                        height={338}
                        className="di-bg-cover di-w-full di-bg-center di-rounded-t-[22px] di-rounded-b-none di-h-64"
                      />
                      <div className="di-px-4 di-w-full di-flex-1 di-flex di-flex-col">
                        <div className="di-group di-relative">
                          <h3 className="di-mt-4 di-text-2xl di-font-bold di-group-hover:di-text-blue-500 di-line-clamp-3">
                            {itemNews.title}
                          </h3>
                          <p className="di-text-[#3D3D3D] di-line-clamp-2 di-mt-4">
                            {itemNews.content}
                          </p>
                        </div>
                      </div>
                      <div className="di-mt-6 di-px-4 di-pb-4 di-flex di-flex-col di-justify-between di-w-full di-font-lensgrotesk">
                        <p className="di-text-xl">
                          {
                            new Date(Number(itemNews.date_created))
                              .toISOString()
                              .split("T")[0]
                          }
                        </p>
                      </div>
                    </Link>
                  );
                })}
              </div>
              <Link href="/news" className="di-px-4 di-mx-auto">
                <JpButton variant="navigation" Icon={ArrowRight}>
                  <p className="font-mplus di-text-[16px] di-font-bold">
                    詳しく見る
                  </p>
                </JpButton>
              </Link>
            </div>
          </div>
        </div>
      )}
    </>
  );
}
