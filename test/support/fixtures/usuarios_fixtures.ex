defmodule ConcursoDePreguntasv3.UsuariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ConcursoDePreguntasv3.Usuarios` context.
  """

  @doc """
  Generate a usuario.
  """
  def usuario_fixture(attrs \\ %{}) do
    {:ok, usuario} =
      attrs
      |> Enum.into(%{
        email: "some email",
        nombre: "some nombre",
        password: "some password"
      })
      |> ConcursoDePreguntasv3.Usuarios.create_usuario()

    usuario
  end
end
