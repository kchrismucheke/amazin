defmodule Amazin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AmazinWeb.Telemetry,
      Amazin.Repo,
      {DNSCluster, query: Application.get_env(:amazin, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Amazin.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Amazin.Finch},
      # Start a worker by calling: Amazin.Worker.start_link(arg)
      # {Amazin.Worker, arg},
      # Start to serve requests, typically the last entry
      AmazinWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Amazin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AmazinWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
