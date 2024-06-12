defmodule WorkingWithOtp.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # WorkingWithOtp.Agent.CurrenciesStore
      # WorkingWithOtp.Task.CurrenciesFiller,
      # WorkingWithOtp.GenServer.CurrenciesStoreWithPostInitialization
      # WorkingWithOtp.GenServer.CurrenciesStoreWithPostInitializationMoreSteps
      # WorkingWithOtp.GenServer.CurrenciesStore
    ]

    opts = [strategy: :one_for_one, name: WorkingWithOtp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
