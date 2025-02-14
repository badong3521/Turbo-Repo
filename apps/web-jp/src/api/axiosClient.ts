import type {
  AxiosInstance,
  AxiosResponse,
  AxiosError,
  InternalAxiosRequestConfig,
} from "axios";
import axios from "axios";

const GRAPH_ENDPOINT =
  process.env.NEXT_PUBLIC_GRAPHQL_ENDPOINT ||
  (() => {
    throw new Error("Env GRAPH_ENDPOINT is missing!");
  })();

const axiosClient: AxiosInstance = axios.create({
  baseURL: GRAPH_ENDPOINT,
  headers: {
    "Content-Type": "application/json",
  },
  timeout: 30000,
});

axiosClient.interceptors.request.use(
  (config: InternalAxiosRequestConfig) => {
    return config;
  },
  (error: AxiosError): Promise<AxiosError> => {
    console.error("Request error:", error.message);
    return Promise.reject(error);
  },
);

axiosClient.interceptors.response.use(
  (response: AxiosResponse) => {
    // eslint-disable-next-line @typescript-eslint/no-unsafe-member-access
    if (response.data?.data) {
      return response.data;
    }
    return response;
  },
  (error: AxiosError): Promise<AxiosError> => {
    console.error("Error response:", error.response || error.message);
    return Promise.reject(error);
  },
);

export default axiosClient;
