defmodule Microblog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :post, :text
      add :user_id, :string

      timestamps()
    end

  end
end
