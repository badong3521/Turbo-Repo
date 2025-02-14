import { dbClient } from "@di/orm-util";

export function getAllNavigation() {
  return dbClient.navigations.findMany({
    where: {
      language: "jp",
    },
    include: {
      navigations_children: {
        include: {
          links: true,
        },
        orderBy: {
          id: "asc",
        },
      },
      links: true,
    },
    orderBy: {
      id: "asc",
    },
  });
}
