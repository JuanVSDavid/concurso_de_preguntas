defmodule ConcursoDePreguntasv3Web.Router do
  use ConcursoDePreguntasv3Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ConcursoDePreguntasv3Web do
    pipe_through :api
    resources "/pregunta", PreguntaController, except: [:new, :edit]
    resources "/usuario", UsuarioController, except: [:new, :edit]
    resources "/juego", JuegoController, except: [:new, :edit]
    resources "/puntaje", PuntajeController, except: [:new, :edit]

    # Rutas personalizadas
    get "/juego/preguntas/:id", JuegoController, :show_preguntas_juego
    get "/juego/puntajes/:id", JuegoController, :show_puntajes_juego
  end
end
