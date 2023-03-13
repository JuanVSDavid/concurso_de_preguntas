defmodule ConcursoDePreguntasv3Web.PuntajeController do
  use ConcursoDePreguntasv3Web, :controller

  alias ConcursoDePreguntasv3.Puntajes
  alias ConcursoDePreguntasv3.Puntajes.Puntaje

  action_fallback ConcursoDePreguntasv3Web.FallbackController

  def index(conn, _params) do
    puntajes = Puntajes.list_puntajes()
    render(conn, :index, puntajes: puntajes)
  end

  def create(conn, %{"puntaje" => puntaje_params}) do
    with {:ok, %Puntaje{} = puntaje} <- Puntajes.create_puntaje(puntaje_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/puntaje/#{puntaje.id}")
      |> render(:show, puntaje: puntaje)
    end
  end

  def show(conn, %{"id" => id}) do
    puntaje = Puntajes.get_puntaje!(id)
    render(conn, :show, puntaje: puntaje)
  end

  def update(conn, %{"id" => id, "puntaje" => puntaje_params}) do
    puntaje = Puntajes.get_puntaje!(id)

    with {:ok, %Puntaje{} = puntaje} <- Puntajes.update_puntaje(puntaje, puntaje_params) do
      render(conn, :show, puntaje: puntaje)
    end
  end

  def delete(conn, %{"id" => id}) do
    puntaje = Puntajes.get_puntaje!(id)

    with {:ok, %Puntaje{}} <- Puntajes.delete_puntaje(puntaje) do
      send_resp(conn, :no_content, "")
    end
  end
end
