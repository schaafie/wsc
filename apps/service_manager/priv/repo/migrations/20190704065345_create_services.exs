defmodule ServiceManager.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :url, :string
      add :args, :string
      add :timeout, :integer

      timestamps()
    end

  end
end
