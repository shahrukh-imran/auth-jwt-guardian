defmodule AuthJwtGuardianWeb.UserView do
  use AuthJwtGuardianWeb, :view
  alias AuthJwtGuardianWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      password_hash: user.password_hash}
  end

  def render("token.json", %{token: token}) do
    %{token: token}
  end

end
