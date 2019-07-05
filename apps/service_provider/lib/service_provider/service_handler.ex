defmodule ServiceProvider.ServiceHandler do
  use GenServer

  require HTTPoison

  def start_link(state), do: GenServer.start_link(__MODULE__, state, [])
  def execute(pid), do: GenServer.cast(pid, :exec)
  def getStatus(pid), do: GenServer.call(pid, :get)
  def stop(pid), do: GenServer.stop(pid, :normal)

  ## Callbacks
  def init(service), do: {:ok, service}

  def handle_cast(:exec, from, service) do
    url = "#{service.url}?#{service.api_key}"
    response = HTTPoison.get!(url)
    state = %{ provider: from, name: service.name, url: service.url, response: response }
    GenServer.cast(from, {:update, service.name, response.status} )
    {:noreply, state}
  end

  def handle_call(:get, _from, state), do: {:reply, state.response, state}

end
