defmodule ConcursoDePreguntasv3.Usuarios.Usuario do
  use Ecto.Schema
  import Ecto.Changeset

  alias ConcursoDePreguntasv3.Preguntas.Pregunta
  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "usuarios" do
    field :email, :string
    field :nombre, :string
    field :password, :string

    has_many :preguntas, Pregunta
    has_many :puntajes, Puntaje

    timestamps()
  end

  @doc false
  def changeset(usuario, attrs) do
    usuario
    |> cast(attrs, [:nombre, :email, :password])
    |> validate_required([:nombre, :email, :password])
  end
end
