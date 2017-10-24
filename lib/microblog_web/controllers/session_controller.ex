defmodule MicroblogWeb.SessionController do
  use MicroblogWeb, :controller
 
  alias Microblog.Blog
 
  def login(conn, %{"email" => email, "password" => password}) do
    #user = Blog.get_user_by_email(email)
    user = get_and_auth_user(email, password)
 
    if user do
       post = conn.assigns[:current_post]
        #Microblog.Blog.update_post(post, %{user_id: user.id})
 
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.email}")
      |> redirect(to: post_path(conn, :index))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "No such user")
      |> redirect(to: post_path(conn, :index))
    end
  end

  # TODO: Move to user.ex
  def update_tries(throttle, prev) do
    if throttle do
      prev + 1
    else
      1
    end
  end

  def throttle_attempts(user) do
    y2k = DateTime.from_naive!(~N[2000-01-01 00:00:00], "Etc/UTC")
    prv = DateTime.to_unix(user.pw_last_try || y2k)
    now = DateTime.to_unix(DateTime.utc_now())
    thr = (now - prv) < 3600

    if (thr && user.pw_tries > 5) do
      nil
    else
      changes = %{
          pw_tries: update_tries(thr, user.pw_tries),
          pw_last_try: DateTime.utc_now(),
      }
      IO.inspect(user)
      {:ok, user} = Ecto.Changeset.cast(user, changes, [:pw_tries, :pw_last_try])
      |> Microblog.Repo.update
      user
    end
  end


  # In session_controller.ex

  # TODO: Move to user.ex
  def get_and_auth_user(email, password) do
    user = Blog.get_user_by_email(email)
    case Comeonin.Argon2.check_pass(user, password) do
      {:ok, user} -> user
      _else       -> nil
    end
  end

  #def login(conn, %{"email" => email, "password" => password}) do
  #  user = get_and_auth_user(email, password)
    
 
  def logout(conn, _args) do
     conn
     |> put_session(:user_id, nil)
     |> put_flash(:info, "Logged out.")
     |> redirect(to: post_path(conn, :index))
  end

   # TODO: Move to user.ex
#  def update_tries(throttle, prev) do
#    if throttle do
#      prev + 1
#    else
#      1
#    end
#  end
#
#  def throttle_attempts(user) do
#    y2k = DateTime.from_naive!(~N[2000-01-01 00:00:00], "Etc/UTC")
#    prv = DateTime.to_unix(user.pw_last_try || y2k)
#    now = DateTime.to_unix(DateTime.utc_now())
#    thr = (now - prv) < 3600
#
#    if (thr && user.pw_tries > 5) do
#      nil
#    else
#      changes = %{
#          pw_tries: update_tries(thr, user.pw_tries),
#          pw_last_try: DateTime.utc_now(),
#      }
#      IO.inspect(user)
#      {:ok, user} = Ecto.Changeset.cast(user, changes, [:pw_tries, :pw_last_try])
#      |> NuMart.Repo.update
#      user
#    end
#  end
#

end
 