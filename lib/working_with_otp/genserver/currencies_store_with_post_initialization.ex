defmodule WorkingWithOtp.GenServer.CurrenciesStoreWithPostInitialization do
  @moduledoc false

  use GenServer

  require Logger

  # API public functions
  def start_link(opts \\ []) do
    inital_state = []
    opts = Keyword.put_new(opts, :name, __MODULE__)
    GenServer.start_link(__MODULE__, inital_state, opts)
  end

  def init(state) do
    {:ok, state, {:continue, :make_api_call}}
  end

  def add_element(message) do
    GenServer.cast(__MODULE__, {:add_element, message})
  end

  def get_elements() do
    GenServer.call(__MODULE__, :get_elements)
  end

  # Server
  def handle_cast({:add_element, message}, state) do
    state = [message | state]
    {:noreply, state}
  end

  def handle_call(:get_elements, _from_pid, state) do
    {:reply, state, state}
  end

  def handle_continue(:make_api_call, state) do
    Logger.info("handle_continue - make_api_call")
    heavy_operation()

    {:noreply, state}
  end

  def heavy_operation do
    Logger.info("Doing heavy operation")
    Process.sleep(4_000)
    Logger.info("Heavy operation finished!")
    ["UYU", "ARS", "USD"]
  end
end
