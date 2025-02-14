export default function SpinnerLoading() {
  return (
    <div className="di-flex di-items-center di-justify-center di-h-screen">
      <div className="di-relative">
        <div className="di-h-24 di-w-24 di-rounded-full di-border-t-8 di-border-b-8 di-border-gray-200" />
        <div className="di-absolute di-top-0 di-left-0 di-h-24 di-w-24 di-rounded-full di-border-t-8 di-border-b-8 di-border-blue-500 di-animate-spin" />
      </div>
    </div>
  );
}
