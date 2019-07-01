defmodule ServiceManager.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset


  schema "services" do
    field :args, :string
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :url, :args])
    |> validate_required([:name, :url, :args])
  end
end
