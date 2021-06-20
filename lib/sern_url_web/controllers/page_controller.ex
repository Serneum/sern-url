defmodule SernUrlWeb.PageController do
  use SernUrlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
