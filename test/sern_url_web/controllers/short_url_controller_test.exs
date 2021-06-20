defmodule SernUrlWeb.ShortUrlControllerTest do
  use SernUrlWeb.ConnCase

  alias SernUrl.Urls
  alias SernUrl.Urls.ShortUrl

  @create_attrs %{
    hash: "some hash",
    url: "some url"
  }
  @update_attrs %{
    hash: "some updated hash",
    url: "some updated url"
  }
  @invalid_attrs %{hash: nil, url: nil}

  def fixture(:short_url) do
    {:ok, short_url} = Urls.create_short_url(@create_attrs)
    short_url
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all short_urls", %{conn: conn} do
      conn = get(conn, Routes.short_url_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create short_url" do
    test "renders short_url when data is valid", %{conn: conn} do
      conn = post(conn, Routes.short_url_path(conn, :create), short_url: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.short_url_path(conn, :show, id))

      assert %{
               "id" => id,
               "hash" => "some hash",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.short_url_path(conn, :create), short_url: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update short_url" do
    setup [:create_short_url]

    test "renders short_url when data is valid", %{conn: conn, short_url: %ShortUrl{id: id} = short_url} do
      conn = put(conn, Routes.short_url_path(conn, :update, short_url), short_url: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.short_url_path(conn, :show, id))

      assert %{
               "id" => id,
               "hash" => "some updated hash",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, short_url: short_url} do
      conn = put(conn, Routes.short_url_path(conn, :update, short_url), short_url: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete short_url" do
    setup [:create_short_url]

    test "deletes chosen short_url", %{conn: conn, short_url: short_url} do
      conn = delete(conn, Routes.short_url_path(conn, :delete, short_url))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.short_url_path(conn, :show, short_url))
      end
    end
  end

  defp create_short_url(_) do
    short_url = fixture(:short_url)
    %{short_url: short_url}
  end
end
