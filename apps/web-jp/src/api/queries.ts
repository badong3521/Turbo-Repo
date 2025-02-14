const GET_JP_NEWS = `
  query {
    jpNews {
      author
      title
      content
      date_created
      directus_files {
        filename_disk
      }
      users {
        directus_files {
          filename_disk
          id
        }
        username
        id
      }
      id
      slug
      tags
    }
  }
`;

const GET_JP_NEWS_BY_SLUG = `
  query GetJpNewsBySlug($slug: String!) {
    jpNewsBySlug(slug: $slug) {
      id
      slug
      tags
      title
      content
      author
      date_created
      directus_files {
        filename_disk
      }
      users {
        id
        username
        directus_files {
          filename_disk
        }
      }
    }
  }
`;

const GET_JP_DEVELOP = `
  query {
    jpDevelop {
      id
      title
      description
      directus_files {
        filename_disk
      }
    }
  }
`;

const GET_JP_CAROUSEL = `
  query {
    jpCarousel {
      alt
      id
      directus_files {
        filename_disk
      }
    }
  }
`;

const GET_JP_TECHSTACK = `
  query MyQuery {
    jpTechStack {
      title
      jp_techstack_image {
        directus_files {
          filename_disk
          id
        }
        alt
        id
      }
      id
    }
  }
`;

const GET_JP_MARQUEE = `
  query MyQuery {
    jpMarquee {
      alt
      catetory
      id
      directus_files {
        filename_disk
      }
    }
  }
`;

const GET_JP_SERVICES = `
  query MyQuery {
    jpServices {
      id
      links {
        url
      }
      reverse
      title
      content
      directus_files {
        filename_disk
        id
        title
      }

    }
}
`;

const GET_JP_ABOUT = `
  query MyQuery {
    jpAbout {
      jp_about_item_image {
        directus_files_jp_about_item_image_icon_srcTodirectus_files {
          filename_disk
        }
        directus_files {
          filename_disk
        }
        hover_text
        main_text
      }
      directus_files {
        filename_disk
      }
      id
      jp_about_item_text {
        title
        id
      }
    }
  }
`;

const GET_JP_FOOTER = `
query MyQuery {
  jpFooter {
    footers_footer_item_company {
      id
      footer_item_company {
        title
        directus_files {
          filename_disk
        }
        footer_item_company_address {
          title
          directus_files {
            filename_disk
          }
          alt
        }
        alt
      }
    }
    footers_footer_item_social {
      footer_item_social {
        id
        links {
          url
        }
        directus_files {
          filename_disk
        }
      }
      id
    }
  }
}`;

const GET_JP_NAVIGATION = `
  query MyQuery {
  jpNavigation {
    id
    title
    links {
      url
    }
    navigations_children {
      title
      links {
        url
      }
      id
    }
  }
}
`;

const GET_JP_ABOUT_COMPANY = `
query MyQuery {
  jpAboutCompany {
    name
    title
    jp_about_company_detail {
      name
      id
    }
    id
  }
}
`;

const GET_JP_ABOUT_ARTICLES = `
query MyQuery {
  jpAboutArticles {
    id
    title
    description
    directus_files {
      filename_disk
    }
    reverse
  }
}
`;

const GET_JP_SERVICE_POSTS = `
query MyQuery {
  jpServicePosts {
    id
    slug
    services_post_detail {
      description
      id
      title
      reverse
      directus_files {
        filename_disk
      }
    }
    title
  }
}
`;

const MUTATION_SEND_EMAIL = `
  mutation MyMutation($input: InputSendMail!) {
    sendEmail(input: $input) {
      message
    }
  }
`;

const GET_JP_RECRUITER_INTRO = `
query MyQuery {
  jpRecruiterIntro {
    title
    description
  }
}
`;

const GET_JP_SERVICE_POST_BY_SLUG = `
query MyQuery($slug: String!) {
  jpServicePostBySlug(slug: $slug) {
    id
    slug
    services_post_detail {
      description
      id
      title
      reverse
      directus_files {
        filename_disk
      }
    }
    title
  }
}
`;

const GET_JP_WORK_LIST = `
query MyQuery {
  jpWorkList {
    id
    tags
    title
    directus_files {
      filename_disk
    }
    description
  }
}`;
const GET_JP_RECRUITER_FEATURES = `
query MyQuery {
  jpRecruiterFeatures {
    id
    title
    description
    directus_files {
      filename_disk
    }
  }
}
`;

const GET_JP_RECRUITER_JOBS = `
query MyQuery {
  jpRecruiterJobItem {
    id
    title
    links {
      url
    }
  }
}
`;

const GET_JP_RECRUITER_OVERVIEW = `
query MyQuery {
  jpRecruiterOverview {
    id
    alt
    directus_files {
      filename_disk
    }
  }
}
`;

export {
  GET_JP_ABOUT,
  GET_JP_CAROUSEL,
  GET_JP_DEVELOP,
  GET_JP_MARQUEE,
  GET_JP_NEWS,
  GET_JP_SERVICES,
  GET_JP_TECHSTACK,
  GET_JP_FOOTER,
  GET_JP_NAVIGATION,
  GET_JP_ABOUT_COMPANY,
  GET_JP_ABOUT_ARTICLES,
  GET_JP_SERVICE_POSTS,
  GET_JP_SERVICE_POST_BY_SLUG,
  MUTATION_SEND_EMAIL,
  GET_JP_WORK_LIST,
  GET_JP_RECRUITER_INTRO,
  GET_JP_RECRUITER_FEATURES,
  GET_JP_RECRUITER_JOBS,
  GET_JP_RECRUITER_OVERVIEW,
  GET_JP_NEWS_BY_SLUG,
};
