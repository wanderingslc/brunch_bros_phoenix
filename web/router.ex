defmodule BrunchBrosPhoenix.Router do
  use BrunchBrosPhoenix.Web, :router

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

  scope "/", BrunchBrosPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", AboutController, :show
    resources "/users", UserController
    resources "/brunchs", BrunchController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrunchBrosPhoenix do
  #   pipe_through :api
  # end
end
