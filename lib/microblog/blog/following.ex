defmodule Microblog.Blog.Following do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Following


  schema "userfollows" do
    field :follows_user_id, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(%Following{} = following, attrs) do
    following
    |> cast(attrs, [:user_id, :follows_user_id])
    |> validate_required([:user_id, :follows_user_id])
  end
end
