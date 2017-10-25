defmodule Microblog.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias Microblog.Repo

  alias Microblog.Blog.User

  @doc """
  Returns the list of users.
  ## Examples
      iex> list_users()
      [%User{}, ...]
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  ## Examples
      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}
      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.
  ## Examples
      iex> delete_user(user)
      {:ok, %User{}}
      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  ## Examples
      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Microblog.Blog.Post

  @doc """
  Returns the list of posts.
  ## Examples
      iex> list_posts()
      [%Post{}, ...]
  """
  def list_posts do
    Enum.reverse(Repo.all(Post))
  end

  @doc """
  Gets a single post.
  Raises `Ecto.NoResultsError` if the Post does not exist.
  ## Examples
      iex> get_post!(123)
      %Post{}
      iex> get_post!(456)
      ** (Ecto.NoResultsError)
  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.
  ## Examples
      iex> create_post(%{field: value})
      {:ok, %Post{}}
      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.
  ## Examples
      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}
      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Post.
  ## Examples
      iex> delete_post(post)
      {:ok, %Post{}}
      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}
  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.
  ## Examples
      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}
  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end

  alias Microblog.Blog.User

  @doc """
  Returns the list of userfollows.
  ## Examples
      iex> list_userfollows()
      [%User{}, ...]
  """
  def list_userfollows do
    Repo.all(User)
  end

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  #def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  @doc """
  Updates a user.
  ## Examples
      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}
      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  
  Deletes a User.
  ## Examples
      iex> delete_user(user)
      {:ok, %User{}}
      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  ## Examples
      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Microblog.Blog.Following

  @doc """
  Returns the list of userfollows.
  ## Examples
      iex> list_userfollows()
      [%Following{}, ...]
  """
  def list_userfollows do
    Repo.all(Following)
  end

  @doc """
  Gets a single following.
  Raises `Ecto.NoResultsError` if the Following does not exist.
  ## Examples
      iex> get_following!(123)
      %Following{}
      iex> get_following!(456)
      ** (Ecto.NoResultsError)
  """
  def get_following!(id), do: Repo.get!(Following, id)

  @doc """
  Creates a following.
  ## Examples
      iex> create_following(%{field: value})
      {:ok, %Following{}}
      iex> create_following(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_following(attrs \\ %{}) do
    %Following{}
    |> Following.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a following.
  ## Examples
      iex> update_following(following, %{field: new_value})
      {:ok, %Following{}}
      iex> update_following(following, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_following(%Following{} = following, attrs) do
    following
    |> Following.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Following.
  ## Examples
      iex> delete_following(following)
      {:ok, %Following{}}
      iex> delete_following(following)
      {:error, %Ecto.Changeset{}}
  """
  def delete_following(%Following{} = following) do
    Repo.delete(following)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking following changes.
  ## Examples
      iex> change_following(following)
      %Ecto.Changeset{source: %Following{}}
  """
  def change_following(%Following{} = following) do
    Following.changeset(following, %{})
  end

  alias Microblog.Blog.Like

  @doc """
  Returns the list of likes.

  ## Examples

      iex> list_likes()
      [%Like{}, ...]

  def list_likes do
    Repo.all(Like)
  end
  """

  @doc """
  Gets a single like.

  Raises `Ecto.NoResultsError` if the Like does not exist.

  ## Examples

      iex> get_like!(123)
      %Like{}

      iex> get_like!(456)
      ** (Ecto.NoResultsError)

  """
  def get_like!(id), do: Repo.get!(Like, id)

  @doc """
  Creates a like.

  ## Examples

      iex> create_like(%{field: value})
      {:ok, %Like{}}

      iex> create_like(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_like(attrs \\ %{}) do
    %Like{}
    |> Like.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a like.

  ## Examples

      iex> update_like(like, %{field: new_value})
      {:ok, %Like{}}

      iex> update_like(like, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_like(%Like{} = like, attrs) do
    like
    |> Like.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Like.

  ## Examples

      iex> delete_like(like)
      {:ok, %Like{}}

      iex> delete_like(like)
      {:error, %Ecto.Changeset{}}

  """
  def delete_like(%Like{} = like) do
    Repo.delete(like)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking like changes.

  ## Examples

      iex> change_like(like)
      %Ecto.Changeset{source: %Like{}}

  """
  def change_like(%Like{} = like) do
    Like.changeset(like, %{})
  end

  def list_likes do
    Repo.all(Like)
    |> Repo.preload(:user)
  end

  def list_post_likes(post_id) do
    Repo.all(from l in Like, where: l.post_id == ^post_id)
    |> Repo.preload(:user)
  end
  
  def get_like!(id) do
    Repo.get!(Like, id)
    |> Repo.preload(:user)
  end
end
