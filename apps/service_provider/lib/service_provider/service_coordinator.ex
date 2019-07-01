defmodule ServiceProvider.ServiceCoordinator do
  use GenServer
  require Logger

  @registry :service_registry

  ## API
  def start_link(name), do: GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  def stop(name), do: GenServer.stop(via_tuple(name))
  def start(name, list), do: GenServer.cast(via_tuple(name), {:start, list})
  def getResolved(name), do: GenServer.call(via_tuple(name), {:get_resolved})
  def update(name, service, status), do: GenServer.call(via_tuple(name), {:update, service, status})

  ## Callbacks
  def init(state), do: {:ok, state}

  def handle_cast(:start, _from, serviceslist) do
    state = start_services(serviceslist)
    {:noreply, state}
  end

  def handle_call({:get_resolved, _from, serviceslist) do

    {:reply, resolved, services2resolve}
  end

  def handle_cast({:update, from, update) do
    # find and replace data in from element
    {:noreply, updatedservices}
  end

  defp start_services(services_list), do: start_service(services_list)
  defp start_service(started_services, []), do: started_services
  defp start_service(started_services, [service|services_list]) do
    started_service = do_start_service(service)
    start_service([started_service|started_services], services_list)
  end

  defp do_start_service(service) do
    %{service: }
  end

  defp via_tuple(name), do: {:via, Registry, {@registry, name} }

end
