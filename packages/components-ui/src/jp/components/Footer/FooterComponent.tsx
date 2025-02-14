/* eslint-disable @typescript-eslint/no-unsafe-argument */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/no-unsafe-assignment */
import type { TypeJpFooter } from "@di/orm-util" with { "resolution-mode": "import" };
import Image from "next/image";
import { getAbsoluteImageURL } from "../../helpFc";
interface FooterComponentProps {
  footerData: TypeJpFooter[];
}
export const Footer: React.FC<FooterComponentProps> = ({ footerData }) => {
  return (
    <footer>
      <div className="di-bg-main-black lg:di-pt-[86px] di-py-[40px] 2xl:di-px-16 di-flex-col lg:di-flex-row lg:di-px-10 di-px-3 sm:di-gap-8 lg:di-gap-14 sm:di-px-6 di-flex di-text-white di-justify-items-start">
        {footerData[0]?.footers_footer_item_company.map((company) => (
          <div
            key={company.footer_item_company_id}
            className="di-flex di-flex-col di-gap-12 di-w-full lg:di-w-1/3 di-mt-14 sm:di-mt-0"
          >
            <Image
              width={237}
              height={85}
              alt="Image"
              src={getAbsoluteImageURL(
                company.footer_item_company.directus_files.filename_disk,
              )}
              style={{
                objectFit: "cover",
              }}
              className="w-full h-full object-cover"
              sizes="100vw"
            />
            <div className="di-flex di-flex-col di-justify-center di-gap-5">
              <p className="di-font-bold di-text-2xl">
                {company.footer_item_company.title}
              </p>
              {company.footer_item_company.footer_item_company_address.map(
                (address) => (
                  <div
                    key={address.id}
                    className="di-flex di-items-center di-gap-5"
                  >
                    <Image
                      width={24}
                      height={24}
                      src={getAbsoluteImageURL(
                        address.directus_files.filename_disk,
                      )}
                      alt="Icon Location"
                    />
                    <p className="di-break-words lg:di-text-lg di-text-[12px] lg:di-max-w-max">
                      {address.title || ""}
                    </p>
                  </div>
                ),
              )}
            </div>
          </div>
        ))}

        <div className="di-flex di-flex-1 di-items-center di-justify-center lg:di-justify-end di-mx-auto sm:di-mx-0 lg:di-mx-0">
          <div className="di-flex di-flex-wrap di-gap-6 di-mt-14 sm:di-mt-0">
            {footerData[0]?.footers_footer_item_social.map((item) => (
              <a key={item.id} href={item.footer_item_social.links.url || ""}>
                <Image
                  alt="Icon Social"
                  src={getAbsoluteImageURL(
                    item.footer_item_social.directus_files.filename_disk,
                  )}
                  width={30}
                  height={30}
                  className="di-min-h-[28px] di-object-fill"
                />
              </a>
            ))}
          </div>
        </div>
      </div>
      <hr className="sm:di-hidden di-block di-w-full border di-border-b di-border-main-border di-bg-main-black di-pb-[86px]" />
    </footer>
  );
};
