defmodule AuthJwtGuardianWeb.UserController do
  use AuthJwtGuardianWeb, :controller

  alias AuthJwtGuardian.Users
  alias AuthJwtGuardian.Users.User
  alias AuthJwtGuardian.Guardian
  action_fallback AuthJwtGuardianWeb.FallbackController

  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.json", users: users)
  end

  def sign_in(conn, %{"email" => email, "password" => password}) do
    case Users.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        conn
        |> put_status(:created)
        |> render("token.json", token: token)
      _ ->
        {:error, :unauthorized}
    end
  end

  def sign_up(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Users.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("token.json", token: token)
    end
  end

end
