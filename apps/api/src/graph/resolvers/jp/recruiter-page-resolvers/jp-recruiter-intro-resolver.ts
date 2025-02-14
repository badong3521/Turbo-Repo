import { dbClient } from "@di/orm-util";

export function jpRecruiterIntro() {
  return dbClient.jp_recruiter_intro.findFirst();
}
