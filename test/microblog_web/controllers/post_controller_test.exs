defmodule MicroblogWeb.PostControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{post: "some post", user_id: "some user_id"}
  @update_attrs %{post: "some updated post", user_id: "some updated user_id"}
  @invalid_attrs %{post: nil, user_id: nil}

  def fixture(:post) do
    {:ok, post} = Blog.create_post(@create_attrs)
    post
  end

  describe "index" do
    test "lists all posts", %{conn: conn} do
      conn = get conn, post_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Posts"
    end
  end


  describe "create post" do
    end

  describe "edit post" do
    setup [:create_post]

  end


  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete conn, post_path(conn, :delete, post)
      assert redirected_to(conn) == post_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, post_path(conn, :show, post)
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
