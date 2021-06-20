defmodule SernUrl.Urls do
  @moduledoc """
  The Urls context.
  """

  import Ecto.Query, warn: false
  alias SernUrl.Repo

  alias SernUrl.Urls.ShortUrl

  @doc """
  Create a new ShortUrl, or get an existing one if the URL has been used before.
  """
  # I could do away with this function if I made hashes unique, but the md5 was the first thing
  # that came to mind. Alternatives could be something like a random phrase or just a random
  # string
  def get_or_create_short_url(attrs \\ %{}) do
    attrs
    # Do the create first, as we expect URLs to be unique more often
    |> create_short_url()
    |> case do
      {:ok, short_url} -> short_url
      {:error, _} -> get_short_url!(attrs.url)
    end
  end

  @doc """
  Gets a single short_url.

  Raises `Ecto.NoResultsError` if the Short URL does not exist.

  ## Examples

      iex> get_short_url!(123)
      %ShortUrl{}

      iex> get_short_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_short_url!(lookup) do
    ShortUrl
    |> where(hash: ^lookup)
    |> or_where(url: ^lookup)
    |> Repo.one!
  end

  @doc """
  Creates a short_url.

  ## Examples

      iex> create_short_url(%{field: value})
      {:ok, %ShortUrl{}}

      iex> create_short_url(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_short_url(attrs \\ %{}) do
    %ShortUrl{}
    |> ShortUrl.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking short_url changes.

  ## Examples

      iex> change_short_url()
      %Ecto.Changeset{data: %ShortUrl{}}

  """
  def change_short_url(attrs \\ %{}) do
    %ShortUrl{}
    |> ShortUrl.changeset(attrs)
  end
end
