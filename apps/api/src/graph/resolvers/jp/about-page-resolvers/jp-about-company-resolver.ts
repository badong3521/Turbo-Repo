import { dbClient } from "@di/orm-util";

export function jpAboutCompany() {
  return dbClient.jp_about_company.findMany({
    include: {
      jp_about_company_detail: true,
    },
  });
}
