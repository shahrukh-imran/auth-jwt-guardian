defmodule AuthJwtGuardian.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :auth_jwt_guardian,
  module: AuthJwtGuardian.Guardian,
  error_handler: AuthJwtGuardian.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
