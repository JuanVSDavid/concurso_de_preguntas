defmodule ConcursoDePreguntasv3.Preguntas.Pregunta do
  use Ecto.Schema
  import Ecto.Changeset

  alias ConcursoDePreguntasv3.Usuarios.Usuario
  alias ConcursoDePreguntasv3.Juegos.Juego

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "preguntas" do
    field :enunciado, :string
    field :nivel, :string
    field :opciones, {:array, :string}
    field :privado, :boolean, default: false
    field :puntos, :integer
    field :respuesta, :string
    belongs_to :usuario, Usuario, foreign_key: :usuario_id, references: :id
    belongs_to :juego, Juego

    timestamps()
  end

  @doc false
  def changeset(pregunta, attrs) do
    pregunta
    |> cast(attrs, [:enunciado, :nivel, :respuesta, :opciones, :privado, :puntos])
    |> validate_required([:enunciado, :nivel, :respuesta, :opciones, :privado, :puntos])
  end
end
