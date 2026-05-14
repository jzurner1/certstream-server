import Config

config :certstream,
  user_agent: :default,
  full_stream_url: "/full-stream",
  domains_only_url: "/domains-only"

config :logger,
  level: System.get_env("LOG_LEVEL", "info") |> String.to_existing_atom(),
  backends: [:console]

config :honeybadger,
  app: :certstream,
  exclude_envs: [:dev, :test],
  environment_name: System.get_env("MIX_ENV", "prod") |> String.to_existing_atom(),
  use_logger: true,
  api_key: System.get_env("HONEYBADGER_API_KEY", "")

config :hackney, use_default_pool: false

config :statix,
  host: System.get_env("STATSD_HOST", "localhost"),
  port: String.to_integer(System.get_env("STATSD_PORT", "8125"))
