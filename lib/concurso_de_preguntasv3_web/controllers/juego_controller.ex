defmodule ConcursoDePreguntasv3Web.JuegoController do
  use ConcursoDePreguntasv3Web, :controller

  alias ConcursoDePreguntasv3.Juegos
  alias ConcursoDePreguntasv3.Juegos.Juego

  action_fallback ConcursoDePreguntasv3Web.FallbackController

  def index(conn, _params) do
    juegos = Juegos.list_juegos()
    render(conn, :index, juegos: juegos)
  end

  def create(conn, %{"juego" => juego_params}) do
    with {:ok, %Juego{} = juego} <- Juegos.create_juego(juego_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/juego/#{juego}")
      |> render(:show, juego: juego)
    end
  end

  def show(conn, %{"id" => id}) do
    juego = Juegos.get_juego!(id)
    render(conn, :show, juego: juego)
  end

  def show_preguntas_juego(conn, %{"id" => id}) do
    juego = Juegos.get_juego!(id)
    render(conn, :show_juego_preguntas, juego: juego)
  end

  def show_puntajes_juego(conn, %{"id" => id}) do
    juego = Juegos.get_juego!(id)
    render(conn, :show_juego_puntajes, juego: juego)
  end

  def update(conn, %{"id" => id, "juego" => juego_params}) do
    juego = Juegos.get_juego!(id)

    with {:ok, %Juego{} = juego} <- Juegos.update_juego(juego, juego_params) do
      render(conn, :show, juego: juego)
    end
  end

  def delete(conn, %{"id" => id}) do
    juego = Juegos.get_juego!(id)

    with {:ok, %Juego{}} <- Juegos.delete_juego(juego) do
      send_resp(conn, :no_content, "")
    end
  end
end
