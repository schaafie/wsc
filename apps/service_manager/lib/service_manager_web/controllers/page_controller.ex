defmodule ServiceManagerWeb.PageController do
  use ServiceManagerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
