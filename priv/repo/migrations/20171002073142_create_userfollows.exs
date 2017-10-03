defmodule Microblog.Repo.Migrations.CreateUserfollows do
  use Ecto.Migration

  def change do
    create table(:userfollows) do
      add :user_id, references(:users, on_delete: :nothing)
      add :follows_user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:userfollows, [:user_id])
    create index(:userfollows, [:follows_user_id])
  end
end
