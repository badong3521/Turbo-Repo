import type { TypeJpRecruiterIntro } from "@di/orm-util" with { "resolution-mode": "import" };

interface RecruiterIntroComponentProps {
  intro: TypeJpRecruiterIntro;
}
export const RecruiterIntroComponent: React.FC<
  RecruiterIntroComponentProps
> = ({ intro }) => {
  return (
    <div className=" di-py-12 di-px-6 sm:di-px-12 lg:di-p-24 di-font-mplus1">
      <div className="di-flex di-flex-col sm:di-flex-row di-gap-6 sm:di-gap-12">
        <div className="di-flex di-flex-col di-justify-center lg:di-justify-start di-items-start sm:di-w-1/3">
          <div className="di-text-2xl sm:di-text-[32px] lg:di-text-4xl di-font-bold di-text-blue-500 lg:di-leading-loose di-leading-loose">
            {intro.title}
          </div>
        </div>

        <div className="di-flex-1 di-text-lg di-leading-8 di-text-gray-700 di-whitespace-pre-line">
          <p>{intro.description}</p>
        </div>
      </div>
    </div>
  );
};
