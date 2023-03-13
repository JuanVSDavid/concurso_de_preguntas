defmodule ConcursoDePreguntasv3.JuegosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConcursoDePreguntasv3.Juegos` context.
  """

  @doc """
  Generate a juego.
  """
  def juego_fixture(attrs \\ %{}) do
    {:ok, juego} =
      attrs
      |> Enum.into(%{
        descripcion: "some descripcion",
        privado: true,
        titulo: "some titulo"
      })
      |> ConcursoDePreguntasv3.Juegos.create_juego()

    juego
  end
end
