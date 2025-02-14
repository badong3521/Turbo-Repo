import { dbClient } from "@di/orm-util";

export function jpRecruiterFeatures() {
  return dbClient.jp_recruiter_features.findMany({
    include: {
      directus_files: {
        select: {
          id: true,
          filename_disk: true,
          title: true,
        },
      },
    },
  });
}
