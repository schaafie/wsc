defmodule ServiceProvider.ServiceHandler do
  use GenServer

  require "HTTPoison"

  def start_link(state), do: GenServer.start_link(__MODULE__, state, name: __MODULE__)
  def execute(pid, service), do: GenServer.cast(pid, {:exec, service})
  def getStatus(pid), do: GenServer.call(pid, :get)

  ## Callbacks
  def init(state), do: {:ok, state}

  def handle_cast(:exec, from, service) do
    url = "#{service.url}?#{api_key}"
    response = HTTPoison.get!(url)
    state = %{ provider: from, name: service.name, url: service.url, response: response }
    GenServer.cast(from, {:update, service.name, response.status} )
    {:noreply, state}
  end

  def handle_call(:get, _from, state), do: {:reply, state.response, state}
  def handle_info(:stop, state), do: {:stop, :normal, state}

end
