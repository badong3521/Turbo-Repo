export default function NotFound() {
  return (
    <section className="di-bg-white">
      <div className="di-py-8 di-px-4 di-mx-auto di-max-w-screen-xl di-lg:di-py-16 di-lg:di-px-6 di-h-screen di-flex di-items-center di-justify-center">
        <div className="di-mx-auto di-max-w-screen-sm di-text-center">
          <h1 className="di-mb-4 di-text-7xl di-tracking-tight di-font-extrabold di-lg:di-text-9xl di-text-primary-600">
            404
          </h1>
          <p className="di-mb-4 di-text-3xl di-tracking-tight di-font-bold di-text-gray-900 di-md:di-text-4xl">
            Something's missing.
          </p>
          <p className="di-mb-4 di-text-lg di-font-light di-text-gray-500">
            Sorry, we can't find that page. You'll find lots to explore on the
            home page.{" "}
          </p>
          <a
            href="/"
            className="di-inline-flex di-text-main-black di-bg-primary-600 focus:di-ring-4 focus:di-outline-none focus:di-ring-primary-secondary di-font-medium di-rounded-lg di-text-sm di-px-5 di-py-2.5 di-text-center di-my-4"
          >
            Back to Homepage
          </a>
        </div>
      </div>
    </section>
  );
}
