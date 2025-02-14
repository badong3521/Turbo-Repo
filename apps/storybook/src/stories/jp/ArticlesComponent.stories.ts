import { ArticlesComponent } from "@di/components-ui";
import { Meta, StoryObj } from "@storybook/react";

const meta: Meta<typeof ArticlesComponent> = {
  title: "Component Web JP/ArticlesComponent",
  component: ArticlesComponent,
  parameters: {
    layout: "fullscreen",
  },
  tags: ["autodocs"],
  argTypes: {
    articles: {
      control: { type: "object" },
    },
  },
} satisfies Meta<typeof ArticlesComponent>;

export default meta;

type Story = StoryObj<typeof meta>;

// Default Story
export const Default: Story = {
  args: {
    articles: [
      {
        id: 1,
        title: "トップメッセージ",
        description:
          "Data Impactは、企業のデジタル変革を成功に導く包括的なテクノロジー・ソリューションを提供し、信頼されるパートナーであることを誇りにしています。\n\n経験豊富な専門家チームを擁し、ソフトウェア開発、ビッグデータ、AIからデジタルトランスフォーメーションまでのソリューションを提供し、企業の持続的な成長と業務効率の向上を支援します。\n\nData Impactでは、品質とイノベーションをすべてのプロジェクトの基盤とし、お客様に最高の結果をお約束します。",
        image: "./image.png",
        directus_files: "./image.png",
        reverse: false,
        status: "published",
        user_created: "admin",
        user_updated: "admin",
      },
      {
        id: 2,
        title: "理念",
        description:
          "Data Impactは技術革新に尽力し、お客様の満足を第一に考えています。ITソリューションを提供するだけでなく、各企業のビジネス課題を深く理解し、適切なテクノロジーを適用することで、持続可能な価値を創造し、ビジネスの成長を支援します。",
        image: "./image2.png",
        directus_files: "./image.png",
        reverse: true,
        status: "published",
        user_created: "editor",
        user_updated: "editor",
      },
    ],
  },
};
