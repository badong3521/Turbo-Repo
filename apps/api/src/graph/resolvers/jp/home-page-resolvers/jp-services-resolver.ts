import { dbClient } from "@di/orm-util";

export function getAllJpServices() {
  return dbClient.services.findMany({
    where: {
      language: "jp",
    },
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
          title: true,
        },
      },
      links: true,
    },
    orderBy: {
      id: "asc",
    },
  });
}
