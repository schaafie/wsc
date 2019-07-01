defmodule ServiceProvider.Application do
  @moduledoc false
  use Application

  @registry :service_registry

  def start(_type, _args) do
    children = [
      {Registry, [keys: :unique, name: @registry]},
      {DynamicSupervisor, name: ServiceProvider.ProviderSupervisor, strategy: :one_for_one},
      {DynamicSupervisor, name: ServiceProvider.ServicesSupervisor, strategy: :one_for_one}
    ]
    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
