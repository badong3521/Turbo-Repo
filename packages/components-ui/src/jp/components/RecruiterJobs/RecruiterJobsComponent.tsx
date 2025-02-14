import type { TypeJpRecruiterJobs } from "@di/orm-util" with { "resolution-mode": "import" };
import { ArrowUpRight } from "lucide-react";
import Link from "next/link";
interface RecruiterJobsComponentProps {
  jobs: TypeJpRecruiterJobs[];
}

export const RecruiterJobsComponent: React.FC<RecruiterJobsComponentProps> = ({
  jobs,
}) => {
  return (
    <div className=" di-py-12 di-px-6 sm:di-px-12 sm:di-py-24 lg:di-px-24 di-font-mplus1">
      <div className="di-text-[48px] lg:di-text-[64px] di-font-bold di-text-center di-text-blue-700 di-mb-4 sm:di-mb-12">
        基本情報
      </div>
      <div className="di-text-center di-text-gray-600 di-mb-8 sm:di-mb-12 di-text-[20px] lg:di-text-[24px] di-font-medium">
        株式会社ヘッドウォータースでは一緒に働く仲間を募集しています！
      </div>

      <div className="di-grid di-gap-4 sm:di-grid-cols-2 di-auto-rows-fr">
        {jobs.map((job) => (
          <Link
            key={job.id}
            href={job.links.url || ""}
            className="di-bg-white di-border di-border-gray-300 di-rounded-lg di-shadow-sm di-flex di-items-center di-justify-between sm:di-p-6 di-p-4 di-transition di-duration-200 di-ease-in-out hover:di-shadow-md hover:di-border-blue-500"
          >
            <div className="di-text-gray-800 di-font-medium">{job.title}</div>
            <ArrowUpRight size={40} />
          </Link>
        ))}
      </div>
    </div>
  );
};
