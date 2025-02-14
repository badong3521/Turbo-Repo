import { CompanyComponent } from "@di/components-ui";
import { Meta, StoryObj } from "@storybook/react";

const meta: Meta<typeof CompanyComponent> = {
  title: "Component Web JP/CompanyComponent",
  component: CompanyComponent,
  parameters: {
    layout: "fullscreen",
  },
  tags: ["autodocs"],
  argTypes: {
    company: {
      control: { type: "object" },
      description: "Dữ liệu công ty hiển thị trong CompanyComponent",
    },
  },
} satisfies Meta<typeof CompanyComponent>;

export default meta;

type Story = StoryObj<typeof meta>;

// Default Story
export const Default: Story = {
  args: {
    company: [
      {
        id: 1,
        name: "会社名",
        title: "DATA IMPACT JOINT STOCK COMPANY",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [],
      },
      {
        id: 2,
        name: "設立",
        title: "2023年6月",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [],
      },
      {
        id: 3,
        name: "資本金",
        title: "12 百万円",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [],
      },
      {
        id: 4,
        name: "代表者",
        title: "Dang Quang Duy",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [],
      },
      {
        id: 5,
        name: "所在地",
        title: "11F, Ho Guom Plaza, Tran Phu, Ha Dong",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [],
      },
      {
        id: 6,
        name: "事業内容",
        title: null,
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        jp_about_company_detail: [
          {
            id: 1,
            name: "データサイエンス",
            status: "active",
            user_created: "admin",
            date_created: new Date("2023-01-01"),
            user_updated: "admin",
            date_updated: new Date("2023-01-15"),
            linkto: null,
          },
          {
            id: 2,
            name: "AIソリューション",
            status: "active",
            user_created: "admin",
            date_created: new Date("2023-01-01"),
            user_updated: "admin",
            date_updated: new Date("2023-01-15"),
            linkto: null,
          },
        ],
      },
    ],
  },
};
