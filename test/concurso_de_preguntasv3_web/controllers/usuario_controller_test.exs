defmodule ConcursoDePreguntasv3Web.UsuarioControllerTest do
  use ConcursoDePreguntasv3Web.ConnCase

  import ConcursoDePreguntasv3.UsuariosFixtures

  alias ConcursoDePreguntasv3.Usuarios.Usuario

  @create_attrs %{
    email: "some email",
    nombre: "some nombre",
    password: "some password"
  }
  @update_attrs %{
    email: "some updated email",
    nombre: "some updated nombre",
    password: "some updated password"
  }
  @invalid_attrs %{email: nil, nombre: nil, password: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all usuarios", %{conn: conn} do
      conn = get(conn, ~p"/api/usuarios")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create usuario" do
    test "renders usuario when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/usuarios", usuario: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/usuarios/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some email",
               "nombre" => "some nombre",
               "password" => "some password"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/usuarios", usuario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update usuario" do
    setup [:create_usuario]

    test "renders usuario when data is valid", %{conn: conn, usuario: %Usuario{id: id} = usuario} do
      conn = put(conn, ~p"/api/usuarios/#{usuario}", usuario: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/usuarios/#{id}")

      assert %{
               "id" => ^id,
               "email" => "some updated email",
               "nombre" => "some updated nombre",
               "password" => "some updated password"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, usuario: usuario} do
      conn = put(conn, ~p"/api/usuarios/#{usuario}", usuario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete usuario" do
    setup [:create_usuario]

    test "deletes chosen usuario", %{conn: conn, usuario: usuario} do
      conn = delete(conn, ~p"/api/usuarios/#{usuario}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/usuarios/#{usuario}")
      end
    end
  end

  defp create_usuario(_) do
    usuario = usuario_fixture()
    %{usuario: usuario}
  end
end
