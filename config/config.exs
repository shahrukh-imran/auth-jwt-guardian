# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_jwt_guardian,
  ecto_repos: [AuthJwtGuardian.Repo]

# Configures the endpoint
config :auth_jwt_guardian, AuthJwtGuardianWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rqdREPUvcE58KMkSw1IQLj7udsvX5ovpCKIXZvfJfDFqrLDo04BH4L9rf6TyTZZW",
  render_errors: [view: AuthJwtGuardianWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AuthJwtGuardian.PubSub,
  live_view: [signing_salt: "8uro1uaW"]

config :auth_jwt_guardian, AuthJwtGuardianWeb.Guardian,
  issuer: "auth_jwt_guardian",
  secret_key: "oT27mwvymad0JkflFqomstqAK1Lfgd8dtUFtNs5Y8tKZdjGtAk5YeV66/9PUzMc1"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
