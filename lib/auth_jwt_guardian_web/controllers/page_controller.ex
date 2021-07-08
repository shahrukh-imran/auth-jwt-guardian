defmodule AuthJwtGuardianWeb.PageController do
  use AuthJwtGuardianWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
