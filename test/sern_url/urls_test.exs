defmodule SernUrl.UrlsTest do
  use SernUrl.DataCase

  alias SernUrl.Urls

  describe "short_urls" do
    alias SernUrl.Urls.ShortUrl

    @valid_attrs %{hash: "some hash", url: "some url"}
    @update_attrs %{hash: "some updated hash", url: "some updated url"}
    @invalid_attrs %{hash: nil, url: nil}

    def short_url_fixture(attrs \\ %{}) do
      {:ok, short_url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Urls.create_short_url()

      short_url
    end

    test "list_short_urls/0 returns all short_urls" do
      short_url = short_url_fixture()
      assert Urls.list_short_urls() == [short_url]
    end

    test "get_short_url!/1 returns the short_url with given id" do
      short_url = short_url_fixture()
      assert Urls.get_short_url!(short_url.id) == short_url
    end

    test "create_short_url/1 with valid data creates a short_url" do
      assert {:ok, %ShortUrl{} = short_url} = Urls.create_short_url(@valid_attrs)
      assert short_url.hash == "some hash"
      assert short_url.url == "some url"
    end

    test "create_short_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_short_url(@invalid_attrs)
    end

    test "update_short_url/2 with valid data updates the short_url" do
      short_url = short_url_fixture()
      assert {:ok, %ShortUrl{} = short_url} = Urls.update_short_url(short_url, @update_attrs)
      assert short_url.hash == "some updated hash"
      assert short_url.url == "some updated url"
    end

    test "update_short_url/2 with invalid data returns error changeset" do
      short_url = short_url_fixture()
      assert {:error, %Ecto.Changeset{}} = Urls.update_short_url(short_url, @invalid_attrs)
      assert short_url == Urls.get_short_url!(short_url.id)
    end

    test "delete_short_url/1 deletes the short_url" do
      short_url = short_url_fixture()
      assert {:ok, %ShortUrl{}} = Urls.delete_short_url(short_url)
      assert_raise Ecto.NoResultsError, fn -> Urls.get_short_url!(short_url.id) end
    end

    test "change_short_url/1 returns a short_url changeset" do
      short_url = short_url_fixture()
      assert %Ecto.Changeset{} = Urls.change_short_url(short_url)
    end
  end
end
