defmodule MicroblogWeb.Router do
  use MicroblogWeb, :router
  import MicroblogWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug :fetch_user
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_user
  end

  scope "/", MicroblogWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/posts", PostController
    #resources "/likes", LikeController, except: [:new, :edit]
    resources "/userfollows", FollowingController
    post "/session", SessionController,  :login
    delete "/sessions", SessionController, :logout

#    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", MicroblogWeb do
    pipe_through :api

    resources "/likes", LikeController, except: [:new, :edit]
  end
end
