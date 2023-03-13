defmodule ConcursoDePreguntasv3.Preguntas do
  @moduledoc """
  The Preguntas context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias ConcursoDePreguntasv3.Repo

  alias ConcursoDePreguntasv3.Preguntas.Pregunta
  alias ConcursoDePreguntasv3.Usuarios

  @doc """
  Returns the list of preguntas.

  ## Examples

      iex> list_preguntas()
      [%Pregunta{}, ...]

  """
  def list_preguntas do
    Repo.all(Pregunta)
  end

  @doc """
  Gets a single pregunta.

  Raises `Ecto.NoResultsError` if the Pregunta does not exist.

  ## Examples

      iex> get_pregunta!(123)
      %Pregunta{}

      iex> get_pregunta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pregunta!(id), do: Pregunta |> preload(:usuario) |> Repo.get!(id)

  @doc """
  Creates a pregunta.

  ## Examples

      iex> create_pregunta(%{field: value})
      {:ok, %Pregunta{}}

      iex> create_pregunta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pregunta(attrs \\ %{}) do
    %Pregunta{}
    |> Pregunta.changeset(attrs)
    |> Repo.insert()
  end

  def create_pregunta(changeset, attrs) do
    usuario =
      Ecto.UUID.cast!(attrs["usuario_id"])
      |> Usuarios.get_usuario!()

    changeset
    |> Pregunta.changeset(attrs)
    |> put_assoc(:usuario, usuario)
  end

  @doc """
  Updates a pregunta.

  ## Examples

      iex> update_pregunta(pregunta, %{field: new_value})
      {:ok, %Pregunta{}}

      iex> update_pregunta(pregunta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pregunta(%Pregunta{} = pregunta, attrs) do
    pregunta
    |> preload(:usuario)
    |> Pregunta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pregunta.

  ## Examples

      iex> delete_pregunta(pregunta)
      {:ok, %Pregunta{}}

      iex> delete_pregunta(pregunta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pregunta(%Pregunta{} = pregunta) do
    Repo.delete(pregunta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pregunta changes.

  ## Examples

      iex> change_pregunta(pregunta)
      %Ecto.Changeset{data: %Pregunta{}}

  """
  def change_pregunta(%Pregunta{} = pregunta, attrs \\ %{}) do
    Pregunta.changeset(pregunta, attrs)
  end
end
