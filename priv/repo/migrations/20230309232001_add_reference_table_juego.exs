defmodule ConcursoDePreguntasv3.Repo.Migrations.AddReferenceTableJuego do
  use Ecto.Migration

  def change do
    alter table(:preguntas) do
      add :juego_id,
          references(:juegos, on_delete: :delete_all, on_update: :update_all, type: :binary_id)
    end

    create index(:preguntas, [:juego_id])
  end
end
