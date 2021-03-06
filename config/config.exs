# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :real_world, RealWorldWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UCBQhoo3jW+KU+B9ZzQpXOEy6oIXcrg0QAmFVvjFeqqta0eFezZ4R++9nEqNxMc5",
  render_errors: [view: RealWorldWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealWorld.PubSub,
  live_view: [signing_salt: "wEdbE655"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, Tesla.Adapter.Mint, cacert: ["priv/cacerts.pem"]

config :real_world,
  conduit_backend_api_url: "https://conduit.productionready.io/api"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
