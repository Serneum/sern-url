defmodule SernUrl.Urls.ShortUrl do
  use Ecto.Schema
  import Ecto.Changeset

  schema "short_urls" do
    field :hash, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(short_url, attrs) do
    short_url
    |> cast(attrs, [:url])
    |> validate_required([:url])
    # Another alternative here is to make the hash unique instead, then do a loop
    # whenever we have some sort of collision.
    |> unique_constraint(:url)
    |> hash_url
  end

  @spec hash_url(%Ecto.Changeset{}) :: %Ecto.Changeset{}
  defp hash_url(%Ecto.Changeset{valid?: true, changes: %{url: url}} = changeset) when not is_nil(url) do
    put_change(changeset, :hash, :crypto.hash(:md5, url) |> Base.url_encode64(padding: false))
  end
  defp hash_url(changeset), do: changeset
end
