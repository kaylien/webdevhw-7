defmodule Microblog.Blog.Following do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Following


  schema "userfollows" do
    field :user_id, :id
    field :follows_user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Following{} = following, attrs) do
    following
    |> cast(attrs, [])
    |> validate_required([])
  end
end
