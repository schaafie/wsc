defmodule ServiceManager.Repo do
  use Ecto.Repo,
    otp_app: :service_manager,
    adapter: Ecto.Adapters.Postgres
end
