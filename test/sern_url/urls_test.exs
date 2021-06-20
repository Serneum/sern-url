defmodule SernUrl.UrlsTest do
  use SernUrl.DataCase

  alias SernUrl.Urls

  describe "short_urls" do
    alias SernUrl.Urls.ShortUrl

    @valid_attrs %{"url" => "some url"}
    @invalid_attrs %{"url" =>  nil}

    def short_url_fixture(attrs \\ %{}) do
      {:ok, short_url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Urls.create_short_url()

      short_url
    end

    test "get_or_create_short_url!/1 creates short_url when it does not exist" do
      assert {:ok, %ShortUrl{} = short_url} = Urls.get_or_create_short_url!(@valid_attrs)
      assert short_url.url == "some url"
    end

    test "get_or_create_short_url!/1 gets short_url when it does exist" do
      short_url = short_url_fixture()
      assert Urls.get_or_create_short_url!(@valid_attrs) == {:ok, short_url}
    end

    test "get_short_url!/11 with invalid lookup raises error" do
      assert_raise ArgumentError, "A lookup value must be provided.", fn ->
        Urls.get_short_url!(nil)
      end
    end

    test "get_short_url!/1 returns the short_url with given url" do
      short_url = short_url_fixture()
      assert Urls.get_short_url!(short_url.url) == short_url
    end

    test "get_short_url!/1 returns the short_url with given hash" do
      short_url = short_url_fixture()
      assert Urls.get_short_url!(short_url.hash) == short_url
    end

    test "create_short_url/1 with valid data creates a short_url" do
      assert {:ok, %ShortUrl{} = short_url} = Urls.create_short_url(@valid_attrs)
      assert short_url.url == "some url"
    end

    test "create_short_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Urls.create_short_url(@invalid_attrs)
    end

    test "change_short_url/1 returns a short_url changeset" do
      assert %Ecto.Changeset{} = Urls.change_short_url()
    end
  end
end
