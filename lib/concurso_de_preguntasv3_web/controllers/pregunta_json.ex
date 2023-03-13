defmodule ConcursoDePreguntasv3Web.PreguntaJSON do
  alias ConcursoDePreguntasv3.Preguntas.Pregunta

  @doc """
  Renders a list of preguntas.
  """
  def index(%{preguntas: preguntas}) do
    %{data: for(pregunta <- preguntas, do: data(pregunta))}
  end

  @doc """
  Renders a single pregunta.
  """
  def show(%{pregunta: pregunta}) do
    %{data: data(pregunta)}
  end

  defp data(%Pregunta{} = pregunta) do
    %{
      id: pregunta.id,
      enunciado: pregunta.enunciado,
      nivel: pregunta.nivel,
      respuesta: pregunta.respuesta,
      opciones: pregunta.opciones,
      privado: pregunta.privado,
      puntos: pregunta.puntos
    }
  end
end
