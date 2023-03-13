defmodule ConcursoDePreguntasv3Web.JuegoJSON do
  alias ConcursoDePreguntasv3.Juegos.Juego

  @doc """
  Renders a list of juegos.
  """
  def index(%{juegos: juegos}) do
    %{data: for(juego <- juegos, do: data(juego))}
  end

  @doc """
  Renders a single juego.
  """
  def show(%{juego: juego}) do
    %{data: data(juego)}
  end

  def show_juego_preguntas(%{juego: juego}) do
    %{data: data_con_preguntas(juego)}
  end

  def show_juego_puntajes(%{juego: juego}) do
    %{data: data_con_puntajes(juego)}
  end

  defp data(%Juego{} = juego) do
    %{
      id: juego.id,
      privado: juego.privado,
      titulo: juego.titulo,
      descripcion: juego.descripcion
    }
  end

  def data_con_puntajes(%Juego{} = juego) do
    drop_list = [
      :__meta__,
      :usuario,
      :juego,
      :__struct__,
      :create_at,
      :updated_at,
      :inserted_at,
      :juego_id
    ]

    puntajes = juego.puntajes |> Enum.map(fn puntaje -> puntaje |> Map.drop(drop_list) end)

    %{
      id: juego.id,
      privado: juego.privado,
      titulo: juego.titulo,
      descripcion: juego.descripcion,
      puntajes: puntajes
    }
  end

  defp data_con_preguntas(%Juego{} = juego) do
    drop_list = [
      :__meta__,
      :usuario,
      :juego,
      :__struct__,
      :create_at,
      :updated_at,
      :inserted_at,
      :juego_id
    ]

    preguntas = juego.preguntas |> Enum.map(fn pregunta -> pregunta |> Map.drop(drop_list) end)

    %{
      id: juego.id,
      privado: juego.privado,
      titulo: juego.titulo,
      descripcion: juego.descripcion,
      preguntas: preguntas
    }
  end
end
