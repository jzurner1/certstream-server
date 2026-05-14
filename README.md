# CertStream Server

Aggregates and broadcasts SSL certificates as they're issued live, by watching Certificate Transparency logs.

## Setup (Docker — recommended)

1. Install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
2. Clone the repo and enter the directory:
   ```bash
   git clone https://github.com/jzurner1/certstream-server.git
   cd certstream-server
   ```
3. Build and start the server:
   ```bash
   docker compose up --build
   ```
4. The server is available at `http://localhost:4000`

## Setup (local)

1. Install [Elixir](https://elixir-lang.org/install.html) (1.14+)
2. Fetch dependencies:
   ```bash
   mix deps.get
   ```
3. Run the server:
   ```bash
   mix run --no-halt
   ```

## Endpoints

| Endpoint | Description |
|---|---|
| `ws://localhost:4000/` | WebSocket stream (no DER cert data) |
| `ws://localhost:4000/full-stream` | WebSocket stream with DER-encoded certificates |
| `ws://localhost:4000/domains-only` | WebSocket stream of domain names only |
| `http://localhost:4000/latest.json` | Most recent 25 certificates (JSON) |
| `http://localhost:4000/example.json` | Most recent certificate (JSON) |
| `http://localhost:4000/stats` | Server stats and connected clients |

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `PORT` | `4000` | Port the server listens on |
| `LOG_LEVEL` | `info` | Log verbosity (`debug`, `info`, `warn`, `error`) |
| `HONEYBADGER_API_KEY` | _(empty)_ | API key for Honeybadger error reporting (optional) |
| `STATSD_HOST` | `localhost` | StatsD host for metrics (optional, uses UDP — safe to leave unset) |
| `STATSD_PORT` | `8125` | StatsD port |
| `STATS_URL` | `stats` | URL path for the stats endpoint |
