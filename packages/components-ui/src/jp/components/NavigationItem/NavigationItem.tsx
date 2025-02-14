import Link from "next/link";

interface NavigationItemProps {
  href?: string;
  title: string;
  className?: string;
}

export const NavigationItem: React.FC<NavigationItemProps> = ({
  href,
  title,
  className = "",
}) => {
  return (
    <Link
      href={href || ""}
      className={`from-left c nav-item xl:di-text-xl lg:di-text-lg xl:di-leading-[84px] link-nav ${className}`}
    >
      <p className="hover:di-font-bold">{title}</p>
    </Link>
  );
};
