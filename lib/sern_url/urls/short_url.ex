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
    |> cast(attrs, [:url, :hash])
    |> validate_required([:url, :hash])
  end
end
