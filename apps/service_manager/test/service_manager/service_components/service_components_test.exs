defmodule ServiceManager.ServiceComponentsTest do
  use ServiceManager.DataCase

  alias ServiceManager.ServiceComponents

  describe "services" do
    alias ServiceManager.ServiceComponents.Service

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ServiceComponents.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert ServiceComponents.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert ServiceComponents.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = ServiceComponents.create_service(@valid_attrs)
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ServiceComponents.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, service} = ServiceComponents.update_service(service, @update_attrs)
      assert %Service{} = service
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = ServiceComponents.update_service(service, @invalid_attrs)
      assert service == ServiceComponents.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = ServiceComponents.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> ServiceComponents.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = ServiceComponents.change_service(service)
    end
  end
end
