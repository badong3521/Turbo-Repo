import { dbClient } from "@di/orm-util";

export function getAllJpWorkLists() {
  return dbClient.jp_work_list.findMany({
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

export function getJpWorkListById(id: number) {
  return dbClient.jp_work_list.findUnique({
    where: { id },
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
