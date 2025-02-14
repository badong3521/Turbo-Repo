import { dbClient } from "@di/orm-util";

export function jpRecruiterOverview() {
  return dbClient.jp_recruiter_overview.findMany({
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
