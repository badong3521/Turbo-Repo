import { RecruiterFeaturesComponent } from "@di/components-ui";
import { Meta, StoryObj } from "@storybook/react";

const meta: Meta<typeof RecruiterFeaturesComponent> = {
  title: "Component Web JP/Recruiter Features Component",
  component: RecruiterFeaturesComponent,
  parameters: {
    layout: "fullscreen",
  },
  tags: ["autodocs"],
  argTypes: {
    features: {
      control: { type: "object" },
    },
  },
} satisfies Meta<typeof RecruiterFeaturesComponent>;

export default meta;

type Story = StoryObj<typeof meta>;

// Default Story
export const Default: Story = {
  args: {
    features: [
      {
        id: 1,
        title: "新しい技術はすぐ試す",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        image: "./service.png",
        description:
          "テクノロジーの変化は新たなビジネス機会の芽。新たな機能は世に出たらすぐに触り、自社への適用が可能かをすぐに試しています。",
        directus_files: "./service.png",
      },
      {
        id: 2,
        title: "技術者だらけ",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        image: "./service.png",
        description:
          "技術者が80％の構成で、しかも役員、管理職、営業からPRまで技術者揃い。従業員の約95％が技術分かりな、テクノロジーのビジネス適用の企画と実践を行っています。",
        directus_files: "./service.png",
      },
      {
        id: 3,
        title: "スピード重視",
        status: "active",
        user_created: "admin",
        date_created: new Date("2023-01-01"),
        user_updated: "admin",
        date_updated: new Date("2023-01-15"),
        image: "./service.png",
        description:
          "新技術のプロトタイプをすぐに作り、ビジネス適用面の仮説検証をFit＆Gapを行い、事業のクローズを先ず優位性を図っています。",
        directus_files: "./service.png",
      },
    ],
  },
};
