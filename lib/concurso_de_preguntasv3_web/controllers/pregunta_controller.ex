defmodule ConcursoDePreguntasv3Web.PreguntaController do
  use ConcursoDePreguntasv3Web, :controller

  alias ConcursoDePreguntasv3.Preguntas
  alias ConcursoDePreguntasv3.Preguntas.Pregunta

  action_fallback ConcursoDePreguntasv3Web.FallbackController

  def index(conn, _params) do
    preguntas = Preguntas.list_preguntas()
    render(conn, :index, preguntas: preguntas)
  end

  def create(conn, %{"pregunta" => pregunta_params}) do
    with {:ok, %Pregunta{} = pregunta} <- Preguntas.create_pregunta(pregunta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/pregunta/#{pregunta.id}")
      |> render(:show, pregunta: pregunta)
    end
  end

  def show(conn, %{"id" => id}) do
    pregunta = Preguntas.get_pregunta!(id)
    render(conn, :show, pregunta: pregunta)
  end

  def update(conn, %{"id" => id, "pregunta" => pregunta_params}) do
    pregunta = Preguntas.get_pregunta!(id)

    with {:ok, %Pregunta{} = pregunta} <- Preguntas.update_pregunta(pregunta, pregunta_params) do
      render(conn, :show, pregunta: pregunta)
    end
  end

  def delete(conn, %{"id" => id}) do
    pregunta = Preguntas.get_pregunta!(id)

    with {:ok, %Pregunta{}} <- Preguntas.delete_pregunta(pregunta) do
      send_resp(conn, :no_content, "")
    end
  end
end
