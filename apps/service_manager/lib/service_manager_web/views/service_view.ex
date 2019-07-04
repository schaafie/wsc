defmodule ServiceManagerWeb.ServiceView do
  use ServiceManagerWeb, :view

  def render("services.json", %{response: [services: services, callback: callback] }) do
    services = render_many(services, ServiceManagerWeb.ServiceView, "service.json")
    %{data: %{services: services, callback: callback}}
  end

  def render("service.json", %{service: service}) do
    %{id: service.id, refid: service.refid, name: service.name, html: service.html}
  end
end
