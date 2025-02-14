import { dbClient } from "@di/orm-util";

export function getAllDevelop() {
  return dbClient.jp_develop.findMany({
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
