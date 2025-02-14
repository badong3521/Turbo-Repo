import { dbClient } from "@di/orm-util";

export function getAllMarquee() {
  return dbClient.jp_marquee.findMany({
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
        },
      },
    },
  });
}
