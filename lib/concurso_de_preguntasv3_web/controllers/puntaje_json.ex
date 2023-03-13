defmodule ConcursoDePreguntasv3Web.PuntajeJSON do
  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  @doc """
  Renders a list of puntajes.
  """
  def index(%{puntajes: puntajes}) do
    %{data: for(puntaje <- puntajes, do: data(puntaje))}
  end

  @doc """
  Renders a single puntaje.
  """
  def show(%{puntaje: puntaje}) do
    %{data: data(puntaje)}
  end

  defp data(%Puntaje{} = puntaje) do
    %{
      id: puntaje.id,
      puntaje: puntaje.puntaje
    }
  end
end
