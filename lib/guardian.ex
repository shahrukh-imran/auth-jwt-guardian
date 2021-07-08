defmodule AuthJwtGuardian.Guardian do
  use Guardian, otp_app: :auth_jwt_guardian

  @spec subject_for_token(atom | %{:id => any, optional(any) => any}, any) :: {:ok, binary}
  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = AuthJwtGuardian.Users.get_user!(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
