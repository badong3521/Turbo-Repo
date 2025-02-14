import { dbClient } from "@di/orm-util";

export function getAllCarousel() {
  return dbClient.jp_carousel.findMany({
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
