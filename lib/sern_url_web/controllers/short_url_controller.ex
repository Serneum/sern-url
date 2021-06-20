defmodule SernUrlWeb.ShortUrlController do
  use SernUrlWeb, :controller

  alias SernUrl.Urls
  alias SernUrl.Urls.ShortUrl

  action_fallback SernUrlWeb.FallbackController

  def index(conn, _params) do
    short_urls = Urls.list_short_urls()
    render(conn, "index.json", short_urls: short_urls)
  end

  def create(conn, %{"short_url" => short_url_params}) do
    with {:ok, %ShortUrl{} = short_url} <- Urls.create_short_url(short_url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.short_url_path(conn, :show, short_url))
      |> render("show.json", short_url: short_url)
    end
  end

  def show(conn, %{"id" => id}) do
    short_url = Urls.get_short_url!(id)
    render(conn, "show.json", short_url: short_url)
  end

  def update(conn, %{"id" => id, "short_url" => short_url_params}) do
    short_url = Urls.get_short_url!(id)

    with {:ok, %ShortUrl{} = short_url} <- Urls.update_short_url(short_url, short_url_params) do
      render(conn, "show.json", short_url: short_url)
    end
  end

  def delete(conn, %{"id" => id}) do
    short_url = Urls.get_short_url!(id)

    with {:ok, %ShortUrl{}} <- Urls.delete_short_url(short_url) do
      send_resp(conn, :no_content, "")
    end
  end
end
