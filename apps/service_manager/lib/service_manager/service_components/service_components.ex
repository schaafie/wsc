defmodule ServiceManager.ServiceComponents do
  @moduledoc """
  The ServiceComponents context.
  """

  import Ecto.Query, warn: false
  alias ServiceProvider.ProviderSupervisor

  @doc """
  Start proces of list of services.
  Returns an identifier to retrieve processed Services

  """
  def proces_services(serviceslist) do
    servicenumber = System.unique_integer([])
    ProviderSupervisor.start_child(servicenumber)
    
  end

  @doc """
  Get result of processed services.
  Returns an identifier to retrieve processed Services if not complete
  Returns false if all services were processed

  """

  def get_services(callback) do
    raise "TODO"
  end


end
