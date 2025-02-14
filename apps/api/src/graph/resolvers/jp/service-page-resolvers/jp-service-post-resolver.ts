import { dbClient } from "@di/orm-util";

export function getAllJpServicePosts() {
  return dbClient.jp_service_posts.findMany({
    include: {
      services_post_detail: {
        include: {
          directus_files: true,
        },
      },
    },
    orderBy: {
      id: "asc",
    },
  });
}

export function getServicePostBySlug(slug: string) {
  return dbClient.jp_service_posts.findFirst({
    where: {
      slug,
    },
    include: {
      services_post_detail: {
        include: {
          directus_files: true,
        },
      },
    },
  });
}
