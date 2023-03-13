defmodule ConcursoDePreguntasv3Web.JuegoControllerTest do
  use ConcursoDePreguntasv3Web.ConnCase

  import ConcursoDePreguntasv3.JuegosFixtures

  alias ConcursoDePreguntasv3.Juegos.Juego

  @create_attrs %{
    descripcion: "some descripcion",
    privado: true,
    titulo: "some titulo"
  }
  @update_attrs %{
    descripcion: "some updated descripcion",
    privado: false,
    titulo: "some updated titulo"
  }
  @invalid_attrs %{descripcion: nil, privado: nil, titulo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all juegos", %{conn: conn} do
      conn = get(conn, ~p"/api/juegos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create juego" do
    test "renders juego when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/juegos", juego: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/juegos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some descripcion",
               "privado" => true,
               "titulo" => "some titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/juegos", juego: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update juego" do
    setup [:create_juego]

    test "renders juego when data is valid", %{conn: conn, juego: %Juego{id: id} = juego} do
      conn = put(conn, ~p"/api/juegos/#{juego}", juego: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/juegos/#{id}")

      assert %{
               "id" => ^id,
               "descripcion" => "some updated descripcion",
               "privado" => false,
               "titulo" => "some updated titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, juego: juego} do
      conn = put(conn, ~p"/api/juegos/#{juego}", juego: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete juego" do
    setup [:create_juego]

    test "deletes chosen juego", %{conn: conn, juego: juego} do
      conn = delete(conn, ~p"/api/juegos/#{juego}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/juegos/#{juego}")
      end
    end
  end

  defp create_juego(_) do
    juego = juego_fixture()
    %{juego: juego}
  end
end
