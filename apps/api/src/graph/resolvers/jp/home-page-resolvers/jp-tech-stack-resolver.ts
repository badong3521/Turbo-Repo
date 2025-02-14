import { dbClient } from "@di/orm-util";

export function getAllTechStacks() {
  return dbClient.jp_techstack.findMany({
    include: {
      jp_techstack_image: {
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
