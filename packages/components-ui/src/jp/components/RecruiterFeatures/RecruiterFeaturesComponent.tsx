import type { TypeJpRecruiterFeatures } from "@di/orm-util" with { "resolution-mode": "import" };
import Image from "next/image";
import React from "react";
import { getAbsoluteImageURL } from "../../helpFc";

interface RecruiterFeaturesComponentProps {
  features: TypeJpRecruiterFeatures[];
}
export const RecruiterFeaturesComponent: React.FC<
  RecruiterFeaturesComponentProps
> = ({ features }) => {
  return (
    <div className="di-bg-blue-600 di-text-white di-py-12 lg:di-py-24 di-px-6 sm:di-px-6 lg:di-px-24 di-font-mplus1">
      <div className="lg:di-text-[64px] sm:di-text-[56px] di-text-[48px]  di-font-bold di-text-center di-mb-12">
        基本情報
      </div>

      {features.map((feature) => (
        <div
          key={feature.id}
          className="di-flex di-flex-col sm:di-flex-row di-gap-4 sm:di-gap-10 di-mb-12 last:di-mb-0 di-items-start"
        >
          <div className="di-flex-1 di-flex di-gap-4 di-items-center">
            <Image
              alt="Feature Icon"
              src={getAbsoluteImageURL(feature.directus_files.filename_disk)}
              width={48}
              height={48}
            />
            <div className="di-text-[32px] sm:di-text-[36px] di-flex-1">
              {feature.title}
            </div>
          </div>
          <div className="sm:di-w-1/2 di-text-[20px] lg:di-text-base di-leading-8">
            {feature.description}
          </div>
        </div>
      ))}
    </div>
  );
};
