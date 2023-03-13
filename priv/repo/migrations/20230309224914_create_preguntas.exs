defmodule ConcursoDePreguntasv3.Repo.Migrations.CreatePreguntas do
  use Ecto.Migration

  def change do
    create table(:preguntas, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :enunciado, :string
      add :nivel, :string
      add :respuesta, :string
      add :opciones, {:array, :string}
      add :privado, :boolean, default: false, null: false
      add :puntos, :integer
      add :usuario_id, references(:usuarios, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:preguntas, [:usuario_id])
  end
end
