"use client";
import Image from "next/image";
import { ArrowUpRight, Menu, X } from "lucide-react";
import { useState } from "react";
import Link from "next/link";
import NavigationItem from "./NavigationItem";

function Header() {
  const [isOpen, setIsOpen] = useState<boolean>(false);
  const [expandedParent, setExpandedParent] = useState<string | null>(null);

  const toggleContent = () => {
    setIsOpen(!isOpen);
  };

  const toggleParent = (title: string) => {
    setExpandedParent(expandedParent === title ? null : title);
  };

  return (
    <header className="di-flex font-mplus di-justify-between di-items-center di-fixed di-top-0 di-bg-white md:di-px-16 di-px-3 di-z-50 di-w-full">
      <Image
        width={200}
        height={85}
        alt="Image"
        src="/logo.png"
        className="di-w-52 md:di-w-60 di-h-full di-object-cover"
        sizes="100vw"
      />
      <nav className="md:di-hidden">
        <button
          type="button"
          onClick={toggleContent}
          className="di-flex di-items-center di-justify-center di-w-10 di-h-10 di-rounded-full di-transition-transform di-duration-300"
        >
          {isOpen ? <X size={32} /> : <Menu size={32} />}
        </button>
      </nav>

      {isOpen ? (
        <div className="di-absolute md:di-hidden di-top-[74px] di-rounded-b-lg di-right-0 di-left-0 di-bg-main-black di-text-white di-transition-all di-duration-300">
          <div className="di-px-3 di-my-20 ">
            {fakeDataNav.map((item) => (
              <div key={item.title}>
                <div
                  role="button"
                  tabIndex={0}
                  onClick={() => {
                    if (item.navChildren) {
                      toggleParent(item.title);
                    }
                  }}
                  onKeyDown={(e) => {
                    if (
                      item.navChildren &&
                      (e.key === "Enter" || e.key === " ")
                    ) {
                      toggleParent(item.title);
                    }
                  }}
                  className="di-cursor-pointer"
                >
                  <Link
                    href={item.href}
                    className="di-flex di-justify-between di-items-center"
                  >
                    <p
                      className={`di-text-[32px] di-py-3 ${expandedParent === item.title ? "tex" : ""}`}
                    >
                      {item.title}
                    </p>
                    {item.navChildren ? (
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
                {item.navChildren && expandedParent === item.title ? (
                  <div className="di-flex di-gap-3 di-flex-col di-m-4 di-pl-4">
                    {item.navChildren.map((child) => (
                      <Link key={child.title} href={child.href} passHref>
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

      <nav className="md:di-flex di-justify-between di-items-center di-hidden">
        <NavigationItem href="/" title="トップページ" />
        <NavigationItem href="/" title="サービス" />
        <NavigationItem href="/" title="会社情報" />
        <NavigationItem href="/" title="ニュース" />
        <NavigationItem href="/" title="採用情報" />
        <NavigationItem href="/" title="お問い合わ" />
        <NavigationItem href="/" title="Tech Blog" className="font-lens" />
      </nav>
    </header>
  );
}

export default Header;

const fakeDataNav = [
  {
    title: "トップページ",
    href: "/",
  },
  {
    title: "サービス",
    navChildren: [
      { title: "データサイエンス", href: "/data-science" },
      { title: "AIソリューション", href: "/ai-solutions" },
      { title: "システム開発", href: "/system-development" },
      { title: "DX推進支援", href: "/dx-support" },
    ],
    href: "#",
  },
  {
    title: "会社情報",
    href: "/company",
  },
  {
    title: "ニュース",
    href: "/news",
  },
  {
    title: "採用情報",
    href: "/careers",
  },
  {
    title: "お問い合わ",
    href: "/contact",
  },
  {
    title: "Tech Blog",
    href: "/tech-blog",
  },
];
