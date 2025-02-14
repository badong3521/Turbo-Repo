import { dbClient } from "@di/orm-util";

export function getAllJpNews() {
  return dbClient.jp_news.findMany({
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
        },
      },
      users: {
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
  });
}

export function getJpNewsBySlug(slug: string) {
  return dbClient.jp_news.findUnique({
    where: { slug },
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
        },
      },
      users: {
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
  });
}
