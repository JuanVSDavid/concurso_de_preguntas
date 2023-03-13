defmodule ConcursoDePreguntasv3.Repo.Migrations.CreateJuegos do
  use Ecto.Migration

  def change do
    create table(:juegos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :privado, :boolean, default: false, null: false
      add :titulo, :string
      add :descripcion, :string
      add :usuario_id, references(:usuarios, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:juegos, [:usuario_id])
  end
end
