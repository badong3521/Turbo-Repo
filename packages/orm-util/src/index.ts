import {
  PrismaClient,
  jp_develop,
  jp_news,
  jp_carousel,
  jp_marquee,
  jp_techstack,
  jp_techstack_image,
  directus_files,
  services,
  jp_about,
  jp_about_item_image,
  jp_about_item_text,
  footers,
  footers_footer_item_social,
  footer_item_social,
  links,
  footers_footer_item_company,
  footer_item_company,
  footer_item_company_address,
  navigations,
  navigations_children,
  jp_about_company,
  jp_about_company_detail,
  jp_about_articles,
  jp_service_posts,
  services_post_detail,
  jp_work_list,
  jp_recruiter_intro,
  jp_recruiter_job_item,
  jp_recruiter_features,
  jp_recruiter_overview,
  users,
  jp_contact_email,
} from "@prisma/client";

export const dbClient = new PrismaClient();

export type TypeJpNews = jp_news & {
  directus_files: directus_files;
  users: users & {
    directus_files: directus_files;
  };
};

export type TypeJpDevelop = jp_develop & {
  directus_files: directus_files;
};
export type TypeJpCarousel = jp_carousel & {
  directus_files: directus_files;
};
export type TypeJpMarquee = jp_marquee & {
  directus_files: directus_files;
};
export type TypeJpTechStack = jp_techstack & {
  directus_files: directus_files;
  jp_techstack_image: (jp_techstack_image & {
    directus_files: directus_files;
  })[];
};
export type TypeJpTechStackImage = jp_techstack_image & {
  directus_files: directus_files;
};

export type TypeJpServices = services & {
  links: links;
  directus_files: directus_files;
};

export type TypeJpAbout = jp_about & {
  directus_files: directus_files;
  jp_about_item_image: (jp_about_item_image & {
    directus_files: directus_files;
    directus_files_jp_about_item_image_icon_srcTodirectus_files: directus_files;
    main_text?: string;
    hover_text?: string;
  })[];
  jp_about_item_text: jp_about_item_text[];
};

export type TypeJpFooter = footers & {
  footers_footer_item_social: (footers_footer_item_social & {
    footer_item_social: footer_item_social & {
      directus_files: directus_files;
      links: links;
    };
  })[];
  footers_footer_item_company: (footers_footer_item_company & {
    footer_item_company: footer_item_company & {
      directus_files: directus_files;
      footer_item_company_address: (footer_item_company_address & {
        directus_files: directus_files;
      })[];
    };
  })[];
};

export type TypeJpNavigation = navigations & {
  links: links;
  navigations_children: (navigations_children & {
    links: links;
  })[];
};

export type TypeJpAboutCompany = jp_about_company & {
  jp_about_company_detail: jp_about_company_detail[];
};

export type TypeJpAboutArticles = jp_about_articles & {
  directus_files: directus_files;
};

export type TypeServicePosts = jp_service_posts & {
  directus_files: directus_files;
  links: links;
  services_post_detail: (services_post_detail & {
    directus_files: directus_files;
  })[];
};

export type TypeJpWorkList = jp_work_list & {
  directus_files: directus_files;
};

export type TypeJpRecruiterIntro = jp_recruiter_intro;

export type TypeJpRecruiterFeatures = jp_recruiter_features & {
  directus_files: directus_files;
};

export type TypeJpRecruiterJobs = jp_recruiter_job_item & {
  links: links;
};

export type TypeJpRecruiterOverview = jp_recruiter_overview & {
  directus_files: directus_files;
};

export type TypeJpContactEmail = jp_contact_email;
