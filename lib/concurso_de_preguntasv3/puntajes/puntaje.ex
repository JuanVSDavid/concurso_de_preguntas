defmodule ConcursoDePreguntasv3.Puntajes.Puntaje do
  use Ecto.Schema
  import Ecto.Changeset

  alias ConcursoDePreguntasv3.Juegos.Juego
  alias ConcursoDePreguntasv3.Usuarios.Usuario

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "puntajes" do
    field :puntaje, :integer
    belongs_to :juego, Juego, foreign_key: :juego_id
    belongs_to :usuario, Usuario, foreign_key: :usuario_id
    timestamps()
  end

  @doc false
  def changeset(puntaje, attrs) do
    puntaje
    |> cast(attrs, [:puntaje])
    |> validate_required([:puntaje])
  end
end
