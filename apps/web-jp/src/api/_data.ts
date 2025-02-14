import type {
  TypeJpAbout,
  TypeJpAboutArticles,
  TypeJpAboutCompany,
  TypeJpCarousel,
  TypeJpDevelop,
  TypeJpFooter,
  TypeJpMarquee,
  TypeJpNavigation,
  TypeJpNews,
  TypeJpRecruiterFeatures,
  TypeJpRecruiterIntro,
  TypeJpRecruiterJobs,
  TypeJpRecruiterOverview,
  TypeJpServices,
  TypeJpTechStack,
  TypeJpWorkList,
  TypeServicePosts,
} from "@di/orm-util";
import axiosClient from "./axiosClient";
import {
  GET_JP_NEWS,
  GET_JP_DEVELOP,
  GET_JP_CAROUSEL,
  GET_JP_TECHSTACK,
  GET_JP_MARQUEE,
  GET_JP_SERVICES,
  GET_JP_ABOUT,
  GET_JP_FOOTER,
  GET_JP_NAVIGATION,
  GET_JP_ABOUT_COMPANY,
  GET_JP_ABOUT_ARTICLES,
  GET_JP_SERVICE_POSTS,
  GET_JP_WORK_LIST,
  GET_JP_SERVICE_POST_BY_SLUG,
  GET_JP_RECRUITER_INTRO,
  GET_JP_RECRUITER_JOBS,
  GET_JP_RECRUITER_FEATURES,
  GET_JP_RECRUITER_OVERVIEW,
  GET_JP_NEWS_BY_SLUG,
  MUTATION_SEND_EMAIL,
} from "./queries";
import type { SendEmailBody } from "./type/send-mail";

export const sendEmail = async (
  body: SendEmailBody,
): Promise<{ message: string }> => {
  const response = await axiosClient.post<{ sendEmail: { message: string } }>(
    "",
    {
      query: MUTATION_SEND_EMAIL,
      variables: { input: body },
    },
  );

  return response.data.sendEmail;
};

export const getAllJpNews = async (): Promise<TypeJpNews[]> => {
  const response = await axiosClient.post<{ jpNews: TypeJpNews[] }>("", {
    query: GET_JP_NEWS,
  });

  return response.data.jpNews;
};

export const getJpNewsBySlug = async (slug: string): Promise<TypeJpNews> => {
  const response = await axiosClient.post<{ jpNewsBySlug: TypeJpNews }>("", {
    query: GET_JP_NEWS_BY_SLUG,
    variables: { slug },
  });

  return response.data.jpNewsBySlug;
};

export const getAllJpDevelop = async (): Promise<TypeJpDevelop[]> => {
  const response = await axiosClient.post<{
    jpDevelop: TypeJpDevelop[];
  }>("", {
    query: GET_JP_DEVELOP,
  });
  return response.data.jpDevelop;
};

export const getAllJpCarousel = async (): Promise<TypeJpCarousel[]> => {
  const response = await axiosClient.post<{ jpCarousel: TypeJpCarousel[] }>(
    "",
    {
      query: GET_JP_CAROUSEL,
    },
  );
  return response.data.jpCarousel;
};

export const getAllTechStack = async (): Promise<TypeJpTechStack[]> => {
  const response = await axiosClient.post<{ jpTechStack: TypeJpTechStack[] }>(
    "",
    {
      query: GET_JP_TECHSTACK,
    },
  );
  return response.data.jpTechStack;
};

export const getAllMarquee = async (): Promise<TypeJpMarquee[]> => {
  const response = await axiosClient.post<{ jpMarquee: TypeJpMarquee[] }>("", {
    query: GET_JP_MARQUEE,
  });
  return response.data.jpMarquee;
};

export const getAllJpServices = async (): Promise<TypeJpServices[]> => {
  const response = await axiosClient.post<{ jpServices: TypeJpServices[] }>(
    "",
    {
      query: GET_JP_SERVICES,
    },
  );
  return response.data.jpServices;
};

export const getAllJpAbout = async (): Promise<TypeJpAbout[]> => {
  const response = await axiosClient.post<{ jpAbout: TypeJpAbout[] }>("", {
    query: GET_JP_ABOUT,
  });

  return response.data.jpAbout;
};

export const getAllJpFooter = async (): Promise<TypeJpFooter[]> => {
  const response = await axiosClient.post<{ jpFooter: TypeJpFooter[] }>("", {
    query: GET_JP_FOOTER,
  });

  return response.data.jpFooter;
};

export const getAllJpNavigation = async (): Promise<TypeJpNavigation[]> => {
  const response = await axiosClient.post<{ jpNavigation: TypeJpNavigation[] }>(
    "",
    {
      query: GET_JP_NAVIGATION,
    },
  );
  return response.data.jpNavigation;
};

export const getAllJpAboutCompany = async (): Promise<TypeJpAboutCompany[]> => {
  const response = await axiosClient.post<{
    jpAboutCompany: TypeJpAboutCompany[];
  }>("", {
    query: GET_JP_ABOUT_COMPANY,
  });
  return response.data.jpAboutCompany;
};

export const getAllJpAboutArticles = async (): Promise<
  TypeJpAboutArticles[]
> => {
  const response = await axiosClient.post<{
    jpAboutArticles: TypeJpAboutArticles[];
  }>("", {
    query: GET_JP_ABOUT_ARTICLES,
  });
  return response.data.jpAboutArticles;
};

export const getAllServicePosts = async (): Promise<TypeServicePosts[]> => {
  const response = await axiosClient.post<{
    jpServicePosts: TypeServicePosts[];
  }>("", {
    query: GET_JP_SERVICE_POSTS,
  });

  return response.data.jpServicePosts;
};

export const getServicePostBySlug = async (
  slug: string,
): Promise<TypeServicePosts> => {
  const response = await axiosClient.post<{
    jpServicePostBySlug: TypeServicePosts;
  }>("", {
    query: GET_JP_SERVICE_POST_BY_SLUG as string,
    variables: { slug },
  });

  return response.data.jpServicePostBySlug;
};

export const getAllJpWorkList = async (): Promise<TypeJpWorkList[]> => {
  const response = await axiosClient.post<{
    jpWorkList: TypeJpWorkList[];
  }>("", {
    query: GET_JP_WORK_LIST,
  });

  return response.data.jpWorkList;
};

export const getAllJpRecruiterIntro =
  async (): Promise<TypeJpRecruiterIntro> => {
    const response = await axiosClient.post<{
      jpRecruiterIntro: TypeJpRecruiterIntro;
    }>("", {
      query: GET_JP_RECRUITER_INTRO,
    });
    return response.data.jpRecruiterIntro;
  };

export const getAllJpRecruiterFeatures = async (): Promise<
  TypeJpRecruiterFeatures[]
> => {
  const response = await axiosClient.post<{
    jpRecruiterFeatures: TypeJpRecruiterFeatures[];
  }>("", {
    query: GET_JP_RECRUITER_FEATURES,
  });
  return response.data.jpRecruiterFeatures;
};

export const getAllJpRecruiterJobs = async (): Promise<
  TypeJpRecruiterJobs[]
> => {
  const response = await axiosClient.post<{
    jpRecruiterJobItem: TypeJpRecruiterJobs[];
  }>("", {
    query: GET_JP_RECRUITER_JOBS,
  });
  return response.data.jpRecruiterJobItem;
};

export const getAllJpRecruiterOverview = async (): Promise<
  TypeJpRecruiterOverview[]
> => {
  const response = await axiosClient.post<{
    jpRecruiterOverview: TypeJpRecruiterOverview[];
  }>("", {
    query: GET_JP_RECRUITER_OVERVIEW,
  });
  return response.data.jpRecruiterOverview;
};
