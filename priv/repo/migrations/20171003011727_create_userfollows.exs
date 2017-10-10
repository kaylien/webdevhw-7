defmodule Microblog.Repo.Migrations.CreateUserfollows do
  use Ecto.Migration

  def change do
    create table(:userfollows) do
      add :user_id, :string
      add :follows_user_id, :string

      timestamps()
    end

  end
end
