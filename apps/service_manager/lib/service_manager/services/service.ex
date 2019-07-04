defmodule ServiceManager.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :args, :string
    field :name, :string
    field :timeout, :integer
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :url, :args, :timeout])
    |> validate_required([:name, :url, :args, :timeout])
  end
end
