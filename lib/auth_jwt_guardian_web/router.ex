defmodule AuthJwtGuardianWeb.Router do
  use AuthJwtGuardianWeb, :router
  alias AuthJwtGuardian.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  pipeline :jwt_authenticated do
    plug AuthJwtGuardian.Guardian.AuthPipeline
  end

  scope "/api", AuthJwtGuardianWeb do
    pipe_through [:api, :jwt_authenticated]

  end

  scope "/", AuthJwtGuardianWeb do
    pipe_through :browser
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", AuthJwtGuardianWeb do
    pipe_through :api
    post "/sign_up", UserController, :sign_up
    post "/sign_in", UserController, :sign_in
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AuthJwtGuardianWeb.Telemetry
    end
  end
end
