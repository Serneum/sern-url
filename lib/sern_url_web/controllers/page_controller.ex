defmodule SernUrlWeb.PageController do
  use SernUrlWeb, :controller

  alias SernUrl.Urls

  def index(conn, _params) do
    changeset = Urls.short_url_changeset()
    render(conn, "index.html", changeset: changeset)
  end
end
