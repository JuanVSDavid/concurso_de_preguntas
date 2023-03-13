defmodule ConcursoDePreguntasv3.PreguntasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConcursoDePreguntasv3.Preguntas` context.
  """

  @doc """
  Generate a pregunta.
  """
  def pregunta_fixture(attrs \\ %{}) do
    {:ok, pregunta} =
      attrs
      |> Enum.into(%{
        enunciado: "some enunciado",
        nivel: "some nivel",
        opciones: ["option1", "option2"],
        privado: true,
        puntos: 42,
        respuesta: "some respuesta"
      })
      |> ConcursoDePreguntasv3.Preguntas.create_pregunta()

    pregunta
  end
end
