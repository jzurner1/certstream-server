FROM elixir:1.17-alpine AS build

WORKDIR /opt/app

ENV HOME=/opt/app \
    MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    MIX_ENV=prod

RUN apk add --no-cache git build-base

RUN mix local.hex --force && mix local.rebar --force

# Copy dependency manifests first for better layer caching
COPY mix.exs mix.lock ./
RUN mix deps.get --only prod
RUN mix deps.compile

# Copy pre-built frontend assets
COPY frontend/dist/ ./frontend/dist/

# Copy application source
COPY config/ ./config/
COPY lib/ ./lib/

RUN mix compile

EXPOSE 4000

HEALTHCHECK --interval=30s --timeout=10s --start-period=90s --retries=3 \
  CMD wget -qO- http://localhost:4000/latest.json > /dev/null 2>&1 || exit 1

CMD ["mix", "run", "--no-halt"]
