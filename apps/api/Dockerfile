FROM node:20

WORKDIR /app
RUN npm install -g pnpm
RUN npm install -g turbo

COPY . .
RUN turbo prune --scope=api --docker

WORKDIR /app/out/json/ . 
RUN pnpm install

WORKDIR /app/out/full/ . 
RUN pnpm install
RUN pnpm turbo run build --filter=api...

RUN cp /app/apps/api/src/graph/schema.graphql /app/out/full/apps/api/dist/graph/schema.graphql

RUN addgroup --system --gid 1001 graphql
RUN adduser --system --uid 1001 graphql
USER graphql

EXPOSE 8080

CMD node /app/out/full/apps/api/dist/index.js