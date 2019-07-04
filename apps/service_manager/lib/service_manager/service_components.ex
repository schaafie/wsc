defmodule ServiceManager.ServiceComponents do
  @moduledoc """
  The ServiceComponents context.
  """

  alias ServiceProvider.ProviderSupervisor
  alias ServiceProvider.ServiceCoordinator

  @doc """
  Start proces of list of services.
  Returns an identifier to retrieve processed Services
  """
  def proces_services(serviceslist) do
    servicenumber = System.unique_integer([])
    wsc_name = "wsc_#{servicenumber}"
    ProviderSupervisor.start_child(wsc_name)
    ServiceCoordinator.start(wsc_name, serviceslist)
    wsc_name
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
