# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :remote_led_server, RemoteLedServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tiHHajGyql32nMKNPwR0u9VW4Oo6jSdmDne1CtYxu8vXGsSywDIlwGlT4oTvKUH0",
  render_errors: [view: RemoteLedServerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RemoteLedServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
