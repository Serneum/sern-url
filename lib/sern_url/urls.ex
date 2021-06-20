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
  def get_or_create_short_url(attrs \\ %{}) do
    attrs
    |> create_short_url()
    |> case do
      {:ok, short_url} -> short_url
      {:error, _} -> get_short_url!(attrs.url)
    end
  end

  @doc """
  Gets a single short_url.

  Raises `Ecto.NoResultsError` if the Short url does not exist.

  ## Examples

      iex> get_short_url!(123)
      %ShortUrl{}

      iex> get_short_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_short_url!(lookup) do
    Repo.get_by!(ShortUrl, hash: lookup)
    |> case do
      {:ok, short_url} -> short_url
      {:error, _} -> Repo.get_by!(ShortUrl, url: lookup)
    end
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
