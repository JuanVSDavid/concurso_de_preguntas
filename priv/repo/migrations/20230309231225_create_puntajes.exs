defmodule ConcursoDePreguntasv3.Repo.Migrations.CreatePuntajes do
  use Ecto.Migration

  def change do
    create table(:puntajes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :puntaje, :integer
      add :juego_id, references(:juegos, on_delete: :delete_all, type: :binary_id)
      add :usuario_id, references(:usuarios, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:puntajes, [:juego_id])
    create index(:puntajes, [:usuario_id])
  end
end
