defmodule ServiceProvider.ServiceCoordinator do
  use GenServer
  require Logger

  @registry :service_registry

  ## API
  def start_link(name), do: GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  def stop(name), do: GenServer.stop(via_tuple(name))
  def start(name, list), do: GenServer.call(via_tuple(name), {:start, list})
  def getResolved(name), do: GenServer.call(via_tuple(name), :get_resolved)
  def update(name, service, status), do: GenServer.call(via_tuple(name), {:update, service, status})

  ## Callbacks
  def init(state), do: {:ok, state}

  def handle_call({:start, list}, from, state) do
    Logger.info("Handle call start: #{inspect(list)}")
    serviceslist = start_services(list)
    {:noreply, serviceslist}
  end

  def handle_call(:get_resolved, _from, serviceslist) do
    ## loop services_list
    ## return items that have status complete and close them
    ## return also the item count of items yet to be resolved
    resolved=[]
    count=0
    services2resolve = serviceslist
    {:reply, %{resolved: resolved, remaining: count} , services2resolve}
  end

  def handle_call({:update, service, update}, from, serviceslist) do
    # find and replace data in from element
    updatedservices = serviceslist
    {:noreply, updatedservices}
  end

  defp start_services(services_list) do
    Logger.debug("Processing services: #{inspect(services_list)}")

    start_service([],services_list)
  end
  defp start_service(started_services, []), do: started_services
  defp start_service(started_services, [service|services_list]) do
    started_service = do_start_service(service)
    start_service([started_service|started_services], services_list)
  end

  defp do_start_service(service) do
    {:ok, pid} = ServiceProvider.ServicesSupervisor.start_child(service)
    Map.put_new(service, :pid, pid)
  end

  defp via_tuple(name), do: {:via, Registry, {@registry, name} }

end
