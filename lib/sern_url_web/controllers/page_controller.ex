defmodule SernUrlWeb.PageController do
  use SernUrlWeb, :controller

  alias SernUrl.Urls

  def index(conn, _params) do
    changeset = Urls.change_short_url()
    render(conn, "index.html", changeset: changeset)
  end
end
