defmodule ServiceProvider.ServicesSupervisor do
  use DynamicSupervisor
  alias ServiceProvider.ServiceHandler

  def start_link(_args), do: DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)

  def init(_arg), do: DynamicSupervisor.init(strategy: :one_for_one)

  def start_child(args) do
    spec = %{id: ServiceHandler, start: { ServiceHandler, :start_link, [ args ] } }
    DynamicSupervisor.start_child(  __MODULE__, spec )
  end

end
