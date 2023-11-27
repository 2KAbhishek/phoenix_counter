defmodule PhoenixCounterWeb.Router do
  use PhoenixCounterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PhoenixCounterWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixCounterWeb do
    pipe_through :browser

    live "/", Counter
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCounterWeb do
  #   pipe_through :api
  # end
end
