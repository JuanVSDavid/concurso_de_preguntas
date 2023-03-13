defmodule ConcursoDePreguntasv3Web.PreguntaControllerTest do
  use ConcursoDePreguntasv3Web.ConnCase

  import ConcursoDePreguntasv3.PreguntasFixtures

  alias ConcursoDePreguntasv3.Preguntas.Pregunta

  @create_attrs %{
    enunciado: "some enunciado",
    nivel: "some nivel",
    opciones: ["option1", "option2"],
    privado: true,
    puntos: 42,
    respuesta: "some respuesta"
  }
  @update_attrs %{
    enunciado: "some updated enunciado",
    nivel: "some updated nivel",
    opciones: ["option1"],
    privado: false,
    puntos: 43,
    respuesta: "some updated respuesta"
  }
  @invalid_attrs %{enunciado: nil, nivel: nil, opciones: nil, privado: nil, puntos: nil, respuesta: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all preguntas", %{conn: conn} do
      conn = get(conn, ~p"/api/preguntas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pregunta" do
    test "renders pregunta when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/preguntas", pregunta: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/preguntas/#{id}")

      assert %{
               "id" => ^id,
               "enunciado" => "some enunciado",
               "nivel" => "some nivel",
               "opciones" => ["option1", "option2"],
               "privado" => true,
               "puntos" => 42,
               "respuesta" => "some respuesta"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/preguntas", pregunta: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pregunta" do
    setup [:create_pregunta]

    test "renders pregunta when data is valid", %{conn: conn, pregunta: %Pregunta{id: id} = pregunta} do
      conn = put(conn, ~p"/api/preguntas/#{pregunta}", pregunta: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/preguntas/#{id}")

      assert %{
               "id" => ^id,
               "enunciado" => "some updated enunciado",
               "nivel" => "some updated nivel",
               "opciones" => ["option1"],
               "privado" => false,
               "puntos" => 43,
               "respuesta" => "some updated respuesta"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pregunta: pregunta} do
      conn = put(conn, ~p"/api/preguntas/#{pregunta}", pregunta: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pregunta" do
    setup [:create_pregunta]

    test "deletes chosen pregunta", %{conn: conn, pregunta: pregunta} do
      conn = delete(conn, ~p"/api/preguntas/#{pregunta}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/preguntas/#{pregunta}")
      end
    end
  end

  defp create_pregunta(_) do
    pregunta = pregunta_fixture()
    %{pregunta: pregunta}
  end
end
