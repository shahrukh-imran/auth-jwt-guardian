defmodule AuthJwtGuardian.Repo do
  use Ecto.Repo,
    otp_app: :auth_jwt_guardian,
    adapter: Ecto.Adapters.Postgres
end
