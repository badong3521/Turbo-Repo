const nextConfig = {
  reactStrictMode: true,
  output: "export",
  transpilePackages: ["@di/components-ui"],
  experimental: {
    metadataBase: new URL("https://jp.dataimpact.vn"),
  },
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname:
          "di-landing-cms-ancsgtgpfwc8gsew.southeastasia-01.azurewebsites.net",
        pathname: "/**",
      },
      {
        protocol: "https",
        hostname: "diwebjpstorage.blob.core.windows.net",
        pathname: "/directus-image/**",
      },
    ],
  },
};

export default nextConfig;
