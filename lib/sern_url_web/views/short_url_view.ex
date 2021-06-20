defmodule SernUrlWeb.ShortUrlView do
  use SernUrlWeb, :view
  alias SernUrlWeb.ShortUrlView

  def render("index.json", %{short_urls: short_urls}) do
    %{data: render_many(short_urls, ShortUrlView, "short_url.json")}
  end

  def render("show.json", %{short_url: short_url}) do
    %{data: render_one(short_url, ShortUrlView, "short_url.json")}
  end

  def render("short_url.json", %{short_url: short_url}) do
    %{id: short_url.id,
      url: short_url.url,
      hash: short_url.hash}
  end
end
