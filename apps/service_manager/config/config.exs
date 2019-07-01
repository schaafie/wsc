# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :service_manager,
  namespace: ServiceManager,
  ecto_repos: [ServiceManager.Repo]

# Configures the endpoint
config :service_manager, ServiceManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/hlMxVxgeXBpgVu1zpCO0zbma3JWIXz2WdISh/NgMjRkyuxXyaHN6TsKPyKjVV/z",
  render_errors: [view: ServiceManagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ServiceManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
