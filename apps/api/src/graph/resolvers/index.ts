import { getAllDevelop } from "./jp/home-page-resolvers/jp-develop-resolver.js";
import { getAllCarousel } from "./jp/home-page-resolvers/jp-carousel-resolver.js";
import { getAllTechStacks } from "./jp/home-page-resolvers/jp-tech-stack-resolver.js";
import { getAllMarquee } from "./jp/home-page-resolvers/jp-marquee-resolver.js";
import { getAllJpServices } from "./jp/home-page-resolvers/jp-services-resolver.js";
import { getAllJPAbout } from "./jp/home-page-resolvers/jp-about-resolver.js";
import { getAllFooter } from "./jp/common/jp-footer-resolver.js";
import { getAllNavigation } from "./jp/common/jp-navigation-resoler.js";
import { jpAboutCompany } from "./jp/about-page-resolvers/jp-about-company-resolver.js";
import { jpAboutArticles } from "./jp/about-page-resolvers/jp-about-articles-resolver.js";
import {
  getAllJpServicePosts,
  getServicePostBySlug,
} from "./jp/service-page-resolvers/jp-service-post-resolver.js";
import { getAllJpWorkLists } from "./jp/service-page-resolvers/jp-service-work-list.js";
import { jpRecruiterIntro } from "./jp/recruiter-page-resolvers/jp-recruiter-intro-resolver.js";
import { jpRecruiterJobs } from "./jp/recruiter-page-resolvers/jp-recruiter-jobs-resolver.js";
import { jpRecruiterFeatures } from "./jp/recruiter-page-resolvers/jp-recruiter-features-resolver.js";
import { jpRecruiterOverview } from "./jp/recruiter-page-resolvers/jp-recruiter-overview-resolver.js";
import {
  getAllJpNews,
  getJpNewsBySlug,
} from "./jp/news-page-resolvers/jp-news-resolver.js";
import type { SendEmailArgs } from "./jp/contact-page-resolvers/jp-send-mail.js";
import { postSendMail } from "./jp/contact-page-resolvers/jp-send-mail.js";

export const resolvers = {
  Query: {
    jpNews: () => getAllJpNews(),
    jpNewsBySlug: (_: unknown, { slug }: { slug: string }) =>
      getJpNewsBySlug(slug),
    jpDevelop: () => getAllDevelop(),
    jpCarousel: () => getAllCarousel(),
    jpTechStack: () => getAllTechStacks(),
    jpMarquee: () => getAllMarquee(),
    jpServices: () => getAllJpServices(),
    jpAbout: () => getAllJPAbout(),
    jpFooter: () => getAllFooter(),
    jpNavigation: () => getAllNavigation(),
    jpAboutCompany: () => jpAboutCompany(),
    jpAboutArticles: () => jpAboutArticles(),
    jpServicePosts: () => getAllJpServicePosts(),
    jpServicePostBySlug: async (_: unknown, args: { slug: string }) =>
      getServicePostBySlug(args.slug),
    jpWorkList: () => getAllJpWorkLists(),
    jpRecruiterIntro: () => jpRecruiterIntro(),
    jpRecruiterJobItem: () => jpRecruiterJobs(),
    jpRecruiterFeatures: () => jpRecruiterFeatures(),
    jpRecruiterOverview: () => jpRecruiterOverview(),
  },
  Mutation: {
    sendEmail: async (_: unknown, { input }: { input: SendEmailArgs }) =>
      postSendMail(input),
  },
};
