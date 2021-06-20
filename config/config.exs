# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :sern_url,
  ecto_repos: [SernUrl.Repo]

# Configures the endpoint
config :sern_url, SernUrlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V6kuUTAe3O8KyP0PIsyA/10lObrF+N6pLLZ0EtFD0nAUW7NKSeCA/62N7xhNQS8o",
  render_errors: [view: SernUrlWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SernUrl.PubSub,
  live_view: [signing_salt: "Gb3HW+tw"]

# Slime
config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
