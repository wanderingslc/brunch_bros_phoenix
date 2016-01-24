defmodule BrunchBrosPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :bio, :string
      add :favorite_drink, :string

      timestamps
    end

  end
end
