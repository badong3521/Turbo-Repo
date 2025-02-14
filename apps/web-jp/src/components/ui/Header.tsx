"use client";
import Image from "next/image";
import { ArrowUpRight, FileText, Mail, Menu, X } from "lucide-react";
import { useState } from "react";
import Link from "next/link";
import { JpNavigationItem } from "@di/components-ui";
import type { TypeJpNavigation } from "@di/orm-util";

interface NavigationComponentProps {
  navigationData: TypeJpNavigation[];
}

export const Header: React.FC<NavigationComponentProps> = ({
  navigationData,
}) => {
  const [isOpen, setIsOpen] = useState<boolean>(false);
  const [expandedParent, setExpandedParent] = useState<string | null>(null);

  const toggleContent = () => {
    setIsOpen(!isOpen);
  };

  const toggleParent = (title: string) => {
    setExpandedParent(expandedParent === title ? null : title);
  };

  return (
    <header className="di-flex font-mplus di-justify-between di-items-center di-fixed di-top-0 di-bg-white di-px-4 di-z-50 di-w-full">
      <Link href="/" passHref>
        <Image
          width={200}
          height={85}
          alt="Image"
          src="/logo.png"
          className="di-w-52 md:di-w-60 di-h-24 di-object-contain"
          sizes="100vw"
        />
      </Link>

      {/*MOBILE UI*/}
      <nav className="lg:di-hidden">
        <button
          type="button"
          onClick={toggleContent}
          className="di-flex di-items-center di-justify-center di-w-10 di-h-10 di-rounded-full di-transition-transform di-duration-300 di-text-gray-800"
        >
          {isOpen ? <X size={32} /> : <Menu size={32} />}
        </button>
      </nav>
      {isOpen ? (
        <div className="di-absolute lg:di-hidden di-top-[94px] di-rounded-b-lg di-right-0 di-left-0 di-bg-main-black di-text-white di-transition-all di-duration-300 di-z-50">
          <div className="di-px-3 di-my-20 ">
            {navigationData.map((item) => (
              <div key={item.title}>
                <div
                  role="button"
                  tabIndex={0}
                  onClick={() => {
                    if (item.navigations_children) {
                      toggleParent(item.title || "");
                    }
                  }}
                  onKeyDown={(e) => {
                    if (
                      item.navigations_children &&
                      (e.key === "Enter" || e.key === " ")
                    ) {
                      toggleParent(item.title || "");
                    }
                  }}
                  className="di-cursor-pointer"
                >
                  <Link
                    href={item.links.url || ""}
                    className="di-flex di-justify-between di-items-center"
                  >
                    <p
                      className={`di-text-[28px] di-py-3 ${expandedParent === item.title ? "tex" : ""}`}
                    >
                      {item.title}
                    </p>
                    {!item.links.url ? (
                      <ArrowUpRight
                        size={58}
                        className={`di-transition-all ${
                          expandedParent === item.title ? "di-rotate-180" : ""
                        }`}
                      />
                    ) : null}
                  </Link>
                  <hr className="di-border-main-border" />
                </div>
                {item.navigations_children && expandedParent === item.title ? (
                  <div className="di-flex di-gap-3 di-flex-col di-m-4 di-pl-4">
                    {item.navigations_children.map((child) => (
                      <Link
                        key={child.title}
                        href={child.links.url || ""}
                        passHref
                      >
                        <p className="di-text-sm">- {child.title}</p>
                      </Link>
                    ))}
                  </div>
                ) : null}
              </div>
            ))}
          </div>
        </div>
      ) : null}
      {/*DESKTOP UI*/}
      <div className="lg:di-flex di-justify-between di-items-center di-hidden di-gap-x-4 xl:di-leading-[84px] xl:di-gap-x-12 ">
        {navigationData.map((item) => {
          const hasChildren =
            item.navigations_children && item.navigations_children.length > 0;

          if (hasChildren) {
            return (
              <div
                key={item.id}
                className="from-left nav-item xl:di-text-xl lg:di-text-lg xl:di-leading-[84px] link-nav di-cursor-pointer di-relative di-group di-text-black"
              >
                {item.title || ""}

                <div className="di-hidden group-hover:di-flex di-flex-col di-gap-2 di-absolute di-left-0 di-top-full di-bg-white di-p-1 di-z-10 di-w-[180px] ">
                  {item.navigations_children.map((child) => (
                    <Link
                      href={child.links.url || ""}
                      key={child.id}
                      className="di-px-2 di-py-3 di-text-[16px] di-rounded-lg di-leading-none di-cursor-pointer di-text-black hover:di-bg-primary-main hover:di-text-white "
                    >
                      {child.title || "Untitled"}
                    </Link>
                  ))}
                </div>
              </div>
            );
          } else {
            return (
              <JpNavigationItem
                key={item.id}
                href={item.links.url || "#"}
                title={item.title || ""}
              />
            );
          }
        })}
      </div>
      <nav className="lg:di-flex di-gap-2 di-hidden">
        <Link
          href="/download"
          className="di-flex di-justify-center di-items-center di-gap-1 di-rounded-full di-bg-main-blue di-px-3 di-py-2 di-text-white hover:di-bg-primary-main"
        >
          <p className="font-mplus di-text-[16px]">資料請求</p>
          <FileText />
        </Link>
        <Link
          href="/contact"
          className="di-flex di-justify-center di-items-center di-gap-1 di-rounded-full di-bg-main-blue di-px-3 di-py-2 di-text-white hover:di-bg-primary-main"
        >
          <p className="font-mplus di-text-[16px]">お問い合わせ</p>
          <Mail />
        </Link>
      </nav>
    </header>
  );
};
