import type { Metadata } from "next";
import "./globals.css";
import { Mplus1 } from "./fonts/Mplus1s";
import { LensGrotesk } from "./fonts/LensGrotesk";
import { Header } from "@/components/ui/Header";
import { JpFooter } from "@di/components-ui";
import { getAllJpFooter, getAllJpNavigation } from "@/api/_data";
import Seo from "@/components/ui/Seo";

export const metadata: Metadata = {
  title: "Data Impact",
  description: "Empower Your Will",
  openGraph: {
    images: ["https://dataimpact.vn/images/logo-no-title.png"],
  },
  twitter: {
    images: ["https://dataimpact.vn/images/logo-no-title.png"],
  },
  icons: ["https://dataimpact.vn/images/logo-no-title.png"],
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const [navigation, footer] = await Promise.all([
    getAllJpNavigation(),
    getAllJpFooter(),
  ]);
  return (
    <html lang="en">
      <body className={`${LensGrotesk.variable} ${Mplus1.variable}`}>
        <div className="di-relative di-w-full di-max-w-[2560px]">
          <div className="di-relative di-z-10">
            <div className="di-flex di-flex-col">
              <Seo />
              <Header navigationData={navigation} />
              <div className="di-w-full di-max-w-[2560px] di-pt-24">
                {children}
              </div>
              <JpFooter footerData={footer} />
            </div>
          </div>
        </div>
      </body>
    </html>
  );
}
