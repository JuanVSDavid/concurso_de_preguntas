defmodule ConcursoDePreguntasv3.Puntajes do
  @moduledoc """
  The Puntajes context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias ConcursoDePreguntasv3.Repo

  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  alias ConcursoDePreguntasv3.Juegos
  alias ConcursoDePreguntasv3.Usuarios

  @doc """
  Returns the list of puntajes.

  ## Examples

      iex> list_puntajes()
      [%Puntaje{}, ...]

  """
  def list_puntajes do
    Repo.all(Puntaje)
  end

  @doc """
  Gets a single puntaje.

  Raises `Ecto.NoResultsError` if the Puntaje does not exist.

  ## Examples

      iex> get_puntaje!(123)
      %Puntaje{}

      iex> get_puntaje!(456)
      ** (Ecto.NoResultsError)

  """
  def get_puntaje!(id), do: Repo.get!(Puntaje, id)

  @doc """
  Creates a puntaje.

  ## Examples

      iex> create_puntaje(%{field: value})
      {:ok, %Puntaje{}}

      iex> create_puntaje(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_puntaje(attrs \\ %{}) do
    usuario =
      Ecto.UUID.cast!(attrs["usuario_id"])
      |> Usuarios.get_usuario!()

    juego = Ecto.UUID.cast!(attrs["juego_id"]) |> Juegos.get_juego!()

    %Puntaje{}
    |> Puntaje.changeset(attrs)
    |> put_assoc(:usuario, usuario)
    |> put_assoc(:juego, juego)
    |> Repo.insert()
  end

  @doc """
  Updates a puntaje.

  ## Examples

      iex> update_puntaje(puntaje, %{field: new_value})
      {:ok, %Puntaje{}}

      iex> update_puntaje(puntaje, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_puntaje(%Puntaje{} = puntaje, attrs) do
    puntaje
    |> Puntaje.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a puntaje.

  ## Examples

      iex> delete_puntaje(puntaje)
      {:ok, %Puntaje{}}

      iex> delete_puntaje(puntaje)
      {:error, %Ecto.Changeset{}}

  """
  def delete_puntaje(%Puntaje{} = puntaje) do
    Repo.delete(puntaje)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking puntaje changes.

  ## Examples

      iex> change_puntaje(puntaje)
      %Ecto.Changeset{data: %Puntaje{}}

  """
  def change_puntaje(%Puntaje{} = puntaje, attrs \\ %{}) do
    Puntaje.changeset(puntaje, attrs)
  end
end
