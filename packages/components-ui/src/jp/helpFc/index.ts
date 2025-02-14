const formatDate = (timestamp: string) => {
  const date = new Date(timestamp);
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const day = date.getDate();
  return `${year}.${month}.${day}`;
};

const getAbsoluteImageURL = (url: string | null | undefined) => {
  return `${process.env.NEXT_PUBLIC_IMAGE_ENDPOINT}${url}`;
};

export { formatDate, getAbsoluteImageURL };
