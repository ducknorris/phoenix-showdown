defmodule Benchmarker.Router do
  use Benchmarker.Web, :router

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

  scope "/", Benchmarker do
    pipe_through :browser # Use the default browser stack

    get "/:title", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Benchmarker do
  #   pipe_through :api
  # end
end
