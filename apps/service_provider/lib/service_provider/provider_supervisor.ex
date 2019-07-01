defmodule ServiceProvider.ProviderSupervisor do
  use DynamicSupervisor
  alias ServiceProvider.ServiceCoordinator

  def start_link(_arg),
    do: DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)

  def init(_arg),
    do: DynamicSupervisor.init(strategy: :one_for_one)

  def start_child(child_name) do
    spec = %{id: ServiceCoordinator, start: { ServiceCoordinator, :start_link, [child_name] }, restart: :transient}
    DynamicSupervisor.start_child(  __MODULE__, spec )
  end

end
