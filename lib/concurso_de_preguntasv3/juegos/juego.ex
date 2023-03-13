defmodule ConcursoDePreguntasv3.Juegos.Juego do
  use Ecto.Schema
  import Ecto.Changeset

  alias ConcursoDePreguntasv3.Preguntas.Pregunta
  alias ConcursoDePreguntasv3.Preguntas
  alias ConcursoDePreguntasv3.Usuarios.Usuario
  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "juegos" do
    field :descripcion, :string
    field :privado, :boolean, default: false
    field :titulo, :string
    has_many :preguntas, Pregunta, on_replace: :delete_if_exists
    has_many :puntajes, Puntaje

    belongs_to :usuario, Usuario, foreign_key: :usuario_id
    timestamps()
  end

  @doc false
  def changeset(juego, attrs) do
    juego
    |> cast(attrs, [:privado, :titulo, :descripcion])
    |> cast_assoc(:preguntas,
      required: true,
      with: &Preguntas.create_pregunta/2
    )
    |> validate_required([:privado, :titulo, :descripcion])
  end
end
