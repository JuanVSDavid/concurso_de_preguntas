defmodule ConcursoDePreguntasv3.Juegos do
  @moduledoc """
  The Juegos context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias ConcursoDePreguntasv3.Repo

  alias ConcursoDePreguntasv3.Juegos.Juego
  alias ConcursoDePreguntasv3.Usuarios

  @doc """
  Returns the list of juegos.

  ## Examples

      iex> list_juegos()
      [%Juego{}, ...]

  """
  def list_juegos do
    Repo.all(Juego)
    |> preload(:usuario)
    |> preload(:preguntas)
  end

  @doc """
  Gets a single juego.

  Raises `Ecto.NoResultsError` if the Juego does not exist.

  ## Examples

      iex> get_juego!(123)
      %Juego{}

      iex> get_juego!(456)
      ** (Ecto.NoResultsError)

  """
  def get_juego!(id),
    do:
      Juego
      |> preload(:usuario)
      |> preload(:preguntas)
      |> preload(:puntajes)
      |> Repo.get!(id)

  @doc """
  Creates a juego.

  ## Examples

      iex> create_juego(%{field: value})
      {:ok, %Juego{}}

      iex> create_juego(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_juego(attrs \\ %{}) do
    usuario =
      Ecto.UUID.cast!(attrs["usuario_id"])
      |> Usuarios.get_usuario!()

    %Juego{}
    |> Juego.changeset(attrs)
    |> put_assoc(:usuario, usuario)
    |> Repo.insert()
  end

  @doc """
  Updates a juego.

  ## Examples

      iex> update_juego(juego, %{field: new_value})
      {:ok, %Juego{}}

      iex> update_juego(juego, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_juego(%Juego{} = juego, attrs) do
    usuario =
      Ecto.UUID.cast!(attrs["usuario_id"])
      |> Usuarios.get_usuario!()

    juego
    |> Juego.changeset(attrs)
    |> put_assoc(:usuario, usuario)
    |> Repo.update()
  end

  @doc """
  Deletes a juego.

  ## Examples

      iex> delete_juego(juego)
      {:ok, %Juego{}}

      iex> delete_juego(juego)
      {:error, %Ecto.Changeset{}}

  """
  def delete_juego(%Juego{} = juego) do
    Repo.delete(juego)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking juego changes.

  ## Examples

      iex> change_juego(juego)
      %Ecto.Changeset{data: %Juego{}}

  """
  def change_juego(%Juego{} = juego, attrs \\ %{}) do
    Juego.changeset(juego, attrs)
  end
end
