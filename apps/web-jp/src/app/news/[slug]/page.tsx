import Image from "next/image";
import { Bookmark, MessageSquare, Share2 } from "lucide-react";
import ReactMarkdown from "react-markdown";
import remarkGfm from "remark-gfm";
import remarkToc from "remark-toc";
import rehypeSlug from "rehype-slug";
import { getAllJpNews, getJpNewsBySlug } from "@/api/_data";
import { getAbsoluteImageURL } from "@di/components-ui";
import REVALIDATE_TIME from "@/lib/revalidate";
import type { Metadata } from "next";

interface PageProps {
  params: {
    slug: string;
    id: string;
  };
}

export const revalidate = REVALIDATE_TIME;

interface PropsMetadata {
  params: { slug: string };
}

export async function generateMetadata({
  params,
}: PropsMetadata): Promise<Metadata> {
  const currentNews = await getJpNewsBySlug(params.slug);

  return {
    title: currentNews.title || "",
    description: currentNews.content,
    openGraph: {
      title: currentNews.title || "",
      description: currentNews.content || "",
      images: [getAbsoluteImageURL(currentNews.directus_files.filename_disk)],
      type: "website",
      url: `${process.env.NEXT_PUBLIC_WEBSITE_URL || "https://jp.dataimpact.vn/"}news/${params.slug}`,
    },
    twitter: {
      card: "summary_large_image",
      title: currentNews.title || "",
      description: currentNews.content || "",
      images: [getAbsoluteImageURL(currentNews.directus_files.filename_disk)],
    },
  };
}

const Page = async ({ params }: PageProps) => {
  const { slug } = params;
  const currentNews = await getJpNewsBySlug(slug);

  return (
    <div className="di-min-h-screen" key={currentNews.id}>
      <Image
        alt={`Image ${currentNews.title || "No title"}`}
        src={getAbsoluteImageURL(currentNews.directus_files.filename_disk)}
        width={1920}
        height={701}
        className="di-w-full di-h-[701px] di-object-cover"
      />
      <div className="di-my-16 di-mx-auto di-w-full">
        <div className="di-max-w-[1184px] di-mx-auto di-flex di-flex-col di-items-center">
          <div className="di-flex di-flex-col di-gap-[15px]">
            <h1 className="di-font-medium di-text-[40px] di-text-main-black di-font-mplus1">
              {currentNews.title || "No title"}
            </h1>
            <div className="di-flex di-items-center di-justify-between">
              <div className="di-flex di-gap-[10px] di-items-center">
                <Image
                  alt={currentNews.users.username?.toString() || "Avatar"}
                  src={getAbsoluteImageURL(
                    currentNews.users.directus_files.filename_disk,
                  )}
                  width={32}
                  height={32}
                  className="di-rounded-full di-w-8 di-h-8 di-object-cover"
                />
                <div className="di-flex di-gap-5">
                  <p className="di-text-xl di-text-main-black di-font-mplus1">
                    By {currentNews.users.username}
                  </p>
                  <p className="di-text-xl di-text-main-black di-font-mplus1">
                    {
                      new Date(Number(currentNews.date_created))
                        .toISOString()
                        .split("T")[0]
                    }
                  </p>
                </div>
              </div>
              <div className="di-flex di-gap-[10px]">
                <span className="di-w-10 di-h-10 di-flex di-items-center di-justify-center di-rounded-full di-bg-[#F5F5F5]">
                  <MessageSquare />
                </span>
                <span className="di-w-10 di-h-10 di-flex di-items-center di-justify-center di-rounded-full di-bg-[#F5F5F5]">
                  <Share2 />
                </span>
                <span className="di-w-10 di-h-10 di-flex di-items-center di-justify-center di-rounded-full di-bg-[#F5F5F5]">
                  <Bookmark />
                </span>
              </div>
            </div>
            <hr />
            <div className="di-my-6">
              <ReactMarkdown
                className="post-markdown markdown di-flex-1 di-break-words di-text-main-black di-text-base di-font-normal di- di-leading-relaxed"
                remarkPlugins={[
                  remarkGfm,
                  [remarkToc, { tight: true, maxDepth: 5 }],
                ]}
                rehypePlugins={[rehypeSlug]}
                components={{ img: MarkdownImage }}
                skipHtml
              >
                {currentNews.content || ""}
              </ReactMarkdown>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export async function generateStaticParams() {
  const news = await getAllJpNews();

  return news.map((item) => ({
    slug: item.slug,
  }));
}

const MarkdownImage = ({ src, alt }: { src?: string; alt?: string }) => {
  if (!src) return null;
  return (
    <Image
      src={src}
      alt={alt || "Markdown image"}
      width={600}
      height={400}
      className="di-rounded-lg di-my-4 di-w-full di-h-full"
      priority
    />
  );
};

export default Page;
