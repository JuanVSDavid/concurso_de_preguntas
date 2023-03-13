defmodule ConcursoDePreguntasv3.PuntajesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConcursoDePreguntasv3.Puntajes` context.
  """

  @doc """
  Generate a puntaje.
  """
  def puntaje_fixture(attrs \\ %{}) do
    {:ok, puntaje} =
      attrs
      |> Enum.into(%{
        puntaje: 42
      })
      |> ConcursoDePreguntasv3.Puntajes.create_puntaje()

    puntaje
  end
end
