defmodule ServiceManagerWeb.Router do
  use ServiceManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authentication do
    plug BasicAuth, use_config: {:service_manager, :authentication}
  end

  pipeline :api do
    plug :accepts, ["json"]
    post "/api/wsc", ServiceController, :proces
    get "/api/wsc", ServiceController, :procesUpdate
  end

  scope "/", ServiceManagerWeb do
    pipe_through :browser # Use the default browser stack
    pipe_through [:browser, :authentication]
    get "/", PageController, :index
    resources "/services", ServiceController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ServiceManagerWeb do
  #   pipe_through :api
  # end
end
