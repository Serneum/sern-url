defmodule SernUrlWeb.ShortUrlControllerTest do
  use SernUrlWeb.ConnCase

  alias SernUrl.Urls

  @create_attrs %{
    "url" => "some url"
  }

  def fixture(:short_url) do
    {:ok, short_url} = Urls.create_short_url(@create_attrs)
    short_url
  end

  describe "create short_url" do
    test "renders page_path after short_url creation", %{conn: conn} do
      conn = post(conn, Routes.short_url_path(conn, :create), short_url: @create_attrs)
      short_url = Urls.get_short_url!(@create_attrs["url"])
      assert redirected_to(conn) == Routes.page_path(conn, :index)
      assert get_flash(conn) == %{"info" => "Your shortened URL is #{SernUrlWeb.Router.Helpers.url(conn)}/#{short_url.hash}"}
    end
  end
end
