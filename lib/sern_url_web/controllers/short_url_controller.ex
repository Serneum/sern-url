defmodule SernUrlWeb.ShortUrlController do
  use SernUrlWeb, :controller

  alias SernUrl.Urls
  alias SernUrl.Urls.ShortUrl

  action_fallback SernUrlWeb.FallbackController

  def create(conn, %{"short_url" => short_url_params}) do
    with {:ok, %ShortUrl{} = short_url} <- Urls.get_or_create_short_url(short_url_params) do
      conn
      |> put_flash(:info, "Your shortened URL is #{SernUrlWeb.Router.Helpers.url(conn)}/#{short_url.hash}")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def show(conn, %{"short_url" => hashed_url}) do
    short_url = Urls.get_short_url!(hashed_url)
    conn
    |> redirect(external: short_url.url)
  end
end
