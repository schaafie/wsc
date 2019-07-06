defmodule ServiceManager.ServiceComponents do
  @moduledoc """
  The ServiceComponents context.
  """

  alias ServiceProvider.ProviderSupervisor
  alias ServiceProvider.ServiceCoordinator

  @doc """
  Stop proces of list of services when list is empty.
  """
  def proces_services([]), do: ""

  @doc """
  Start proces of list of services.
  Returns an identifier to retrieve processed Services
  """
  def proces_services(serviceslist) do
    servicenumber = System.unique_integer([])
    wsc_name = "wsc_#{servicenumber}"
    ProviderSupervisor.start_child(wsc_name)
    ServiceCoordinator.start(wsc_name, enrich_services(serviceslist))
    wsc_name
  end

  def enrich_services(list), do: enrich_services([],list)
  def enrich_services(ulist,[]), do: ulist
  def enrich_services(ulist,[item|olist]) do
    case ServiceManager.Services.get_service_by_name(Map.get(item, "service")) do
      nil ->
        uitem = Map.put_new(item, :url, "")
        enrich_services([uitem|ulist],olist)
      result ->
        uitem = Map.put_new(item, :url, result.url)
        enrich_services([uitem|ulist],olist)
    end
  end

  @doc """
  Get result of processed services.
  Returns an identifier to retrieve processed Services if not complete
  Returns false if all services were processed
  """
  def get_services(wsc_name) do
    ServiceCoordinator.getResolved(wsc_name)
  end


end
