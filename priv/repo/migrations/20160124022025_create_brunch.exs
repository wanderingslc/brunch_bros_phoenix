defmodule BrunchBrosPhoenix.Repo.Migrations.CreateBrunch do
  use Ecto.Migration

  def change do
    create table(:brunchs) do
      add :name, :string
      add :address, :string

      timestamps
    end

  end
end
