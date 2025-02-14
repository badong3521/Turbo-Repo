import { dbClient } from "@di/orm-util";

export function jpAboutArticles() {
  return dbClient.jp_about_articles.findMany({
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
        },
      },
    },
    orderBy: {
      id: "asc",
    },
  });
}
