import { dbClient } from "@di/orm-util";

export function jpRecruiterJobs() {
  return dbClient.jp_recruiter_job_item.findMany({
    include: {
      links: true,
    },
  });
}
