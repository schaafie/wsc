defmodule ServiceManager.Services do
  @moduledoc """
  The Services context.
  """

  import Ecto.Query, warn: false
  alias ServiceManager.Repo

  alias ServiceManager.Services.Service

  @doc """
  Returns the list of services.
  """
  def list_services, do: Repo.all(Service)

  @doc """
  Gets a single service by Id.
  Raises `Ecto.NoResultsError` if the Service does not exist.
  """
  def get_service!(id), do: Repo.get!(Service, id)

  @doc """
  Gets a single service by Name.
  Raises `Ecto.NoResultsError` if the Service does not exist.
  """
  def get_service_by_name(name), do: Repo.get_by(Service, name: name)

  @doc """
  Creates a service.
  """
  def create_service(attrs \\ %{}) do
    %Service{}
    |> Service.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service.
  """
  def update_service(%Service{} = service, attrs) do
    service
    |> Service.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Service.
  """
  def delete_service(%Service{} = service), do: Repo.delete(service)

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service changes.
  """
  def change_service(%Service{} = service), do: Service.changeset(service, %{})
end
