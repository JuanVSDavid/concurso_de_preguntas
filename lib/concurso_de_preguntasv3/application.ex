defmodule ConcursoDePreguntasv3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ConcursoDePreguntasv3Web.Telemetry,
      # Start the Ecto repository
      ConcursoDePreguntasv3.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ConcursoDePreguntasv3.PubSub},
      # Start the Endpoint (http/https)
      ConcursoDePreguntasv3Web.Endpoint
      # Start a worker by calling: ConcursoDePreguntasv3.Worker.start_link(arg)
      # {ConcursoDePreguntasv3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ConcursoDePreguntasv3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ConcursoDePreguntasv3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
