# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :brunch_bros_phoenix, BrunchBrosPhoenix.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "4WdugCxAnAUm2KaidvkglYcnf4tI/YeAjkSp83kSTDF0riZjjxoPJsr2O0fyzxJ1",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: BrunchBrosPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false


config :brunch_bros_phoenix, BrunchBrosPhoenix.Repo, 
  adapter: Ecto.Adapters.Postgres,
  database: "brunch_bros_phoenix",
  username: "postgres",
  password: "postgres"