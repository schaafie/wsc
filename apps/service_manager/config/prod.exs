use Mix.Config

config :service_manager, ServiceManagerWeb.Endpoint,
  http: [port: "${PORT}"],
  url: [host: "${HOST}", port: "${PORT}"],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: "${SECRET_KEY_BASE}",
  server: true,
  root: "."

# Do not print debug messages in production
config :logger, level: :info

# import_config "prod.secret.exs"
# Configure your database
config :service_manager, ServiceManager.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "${DB_HOSTNAME}",
  database: "${DB_NAME}",
  username: "${DB_USERNAME}",
  password: "${DB_PASSWORD}",
  pool_size: 20

config :service_manager, authentication: [
  username: {:system, "BASIC_AUTH_USERNAME"},
  password: {:system, "BASIC_AUTH_PASSWORD"},
  realm:    {:system, "BASIC_AUTH_REALM"}
]
