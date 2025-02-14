import { dbClient } from "@di/orm-util";

export function getAllFooter() {
  return dbClient.footers.findMany({
    where: {
      language: "jp",
    },
    include: {
      footers_footer_item_company: {
        include: {
          footer_item_company: {
            include: {
              directus_files: {
                select: {
                  id: true,
                  filename_disk: true,
                },
              },
              footer_item_company_address: {
                include: {
                  directus_files: {
                    select: {
                      id: true,
                      filename_disk: true,
                    },
                  },
                },
              },
            },
          },
        },
      },

      footers_footer_item_social: {
        include: {
          footer_item_social: {
            include: {
              directus_files: {
                select: {
                  id: true,
                  filename_disk: true,
                },
              },
              links: {
                select: {
                  url: true,
                },
              },
            },
          },
        },
      },
    },
  });
}
