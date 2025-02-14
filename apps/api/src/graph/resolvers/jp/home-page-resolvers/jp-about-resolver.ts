import { dbClient } from "@di/orm-util";

export function getAllJPAbout() {
  return dbClient.jp_about.findMany({
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
        },
      },
      jp_about_item_image: {
        include: {
          directus_files: {
            select: {
              id: true,
              filename_disk: true,
            },
          },
          directus_files_jp_about_item_image_icon_srcTodirectus_files: {
            select: {
              id: true,
              filename_disk: true,
            },
          },
        },
      },
      jp_about_item_text: {
        select: {
          title: true,
          id: true,
        },
      },
    },
  });
}
