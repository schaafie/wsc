defmodule ServiceManagerWeb.Router do
  use ServiceManagerWeb, :router

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

  scope "/", ServiceManagerWeb do
    pipe_through :browser
    get "/", PageController, :index
    resources "/services", ServiceController
  end

  # Other scopes may use custom stacks.
  scope "/api", ServiceManagerWeb do
    pipe_through :api
    post "/wsc", ServiceController, :proces
    get "/wsc", ServiceController, :procesUpdate
  end
end
