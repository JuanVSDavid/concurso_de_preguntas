defmodule ConcursoDePreguntasv3.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :email, :string
      add :password, :string

      timestamps()
    end
  end
end
