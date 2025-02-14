import type { TypeJpAboutCompany } from "@di/orm-util" with { "resolution-mode": "import" };

interface CompanyComponentProps {
  company: TypeJpAboutCompany[];
}

export const CompanyComponent: React.FC<CompanyComponentProps> = ({
  company,
}) => {
  console.log("company: ", company);

  return (
    <div className="di-font-mplus1 di-w-full">
      <div className="di-grid di-grid-cols-1 lg:di-grid-cols-2 di-gap-8">
        <div className="di-flex di-flex-col di-gap-8">
          {company.slice(0, 5).map((item) => (
            <div
              key={item.id}
              className="di-flex di-w-full di-items-start di-text-[16px] sm:di-text-[24px]"
            >
              <span className="di-w-1/3 di-font-bold di-text-gray-700">
                {item.name}
              </span>
              {item.title ? (
                <span className="di-w-2/3 di-font-bold di-text-gray-900">
                  {item.title}
                </span>
              ) : (
                <div className="di-w-2/3 di-flex di-flex-col di-gap-y-8 di-font-bold di-text-gray-900">
                  {item.jp_about_company_detail.map((detail) => (
                    <div key={detail.id}>{detail.name}</div>
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>

        <div className="di-flex di-flex-col di-gap-8">
          {/* 3 item cuối cùng nằm ở cột bên phải */}
          {company.slice(5).map((item) => (
            <div
              key={item.id}
              className="di-flex di-w-full di-items-start di-text-[16px] sm:di-text-[24px]"
            >
              <span className="di-w-1/3 di-font-bold di-text-gray-700">
                {item.name}
              </span>
              {item.title ? (
                <span className="di-w-2/3 di-font-bold di-text-gray-900">
                  {item.title}
                </span>
              ) : (
                <div className="di-w-2/3 di-flex di-flex-col di-gap-y-8 di-font-bold di-text-gray-900">
                  {item.jp_about_company_detail.map((detail) => (
                    <div key={detail.id}>{detail.name}</div>
                  ))}
                </div>
              )}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};
