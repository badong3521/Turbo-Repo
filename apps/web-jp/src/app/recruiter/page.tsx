import {
  getAllJpRecruiterFeatures,
  getAllJpRecruiterIntro,
  getAllJpRecruiterJobs,
  getAllJpRecruiterOverview,
} from "@/api/_data";
import {
  DataOverviewComponent,
  RecruiterFeaturesComponent,
  RecruiterIntroComponent,
  RecruiterJobsComponent,
} from "@di/components-ui";
import Image from "next/image";

export default async function Page() {
  const [intro, features, jobs, images] = await Promise.all([
    getAllJpRecruiterIntro(),
    getAllJpRecruiterFeatures(),
    getAllJpRecruiterJobs(),
    getAllJpRecruiterOverview(),
  ]);

  return (
    <div className="di-font-mplus1">
      <div className="di-relative di-w-full">
        <Image
          loading="lazy"
          width={1920}
          height={850}
          className="di-object-cover di-w-full di-min-h-[260px]"
          src="./image-1.png"
          alt="About-Us"
        />
        <div className="di-absolute di-inset-0 di-flex di-items-center di-justify-center di-text-black di-text-[40px]  sm:di-text-[56px] lg:di-text-[80px] xl:di-text-[96px]">
          採用情報
        </div>
      </div>
      <RecruiterIntroComponent intro={intro} />
      <RecruiterFeaturesComponent features={features} />
      <RecruiterJobsComponent jobs={jobs} />
      <DataOverviewComponent images={images} />
    </div>
  );
}
