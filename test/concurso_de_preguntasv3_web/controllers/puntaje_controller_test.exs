defmodule ConcursoDePreguntasv3Web.PuntajeControllerTest do
  use ConcursoDePreguntasv3Web.ConnCase

  import ConcursoDePreguntasv3.PuntajesFixtures

  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  @create_attrs %{
    puntaje: 42
  }
  @update_attrs %{
    puntaje: 43
  }
  @invalid_attrs %{puntaje: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all puntajes", %{conn: conn} do
      conn = get(conn, ~p"/api/puntajes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create puntaje" do
    test "renders puntaje when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/puntajes", puntaje: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/puntajes/#{id}")

      assert %{
               "id" => ^id,
               "puntaje" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/puntajes", puntaje: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update puntaje" do
    setup [:create_puntaje]

    test "renders puntaje when data is valid", %{conn: conn, puntaje: %Puntaje{id: id} = puntaje} do
      conn = put(conn, ~p"/api/puntajes/#{puntaje}", puntaje: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/puntajes/#{id}")

      assert %{
               "id" => ^id,
               "puntaje" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, puntaje: puntaje} do
      conn = put(conn, ~p"/api/puntajes/#{puntaje}", puntaje: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete puntaje" do
    setup [:create_puntaje]

    test "deletes chosen puntaje", %{conn: conn, puntaje: puntaje} do
      conn = delete(conn, ~p"/api/puntajes/#{puntaje}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/puntajes/#{puntaje}")
      end
    end
  end

  defp create_puntaje(_) do
    puntaje = puntaje_fixture()
    %{puntaje: puntaje}
  end
end
