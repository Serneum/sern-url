defmodule SernUrl.Urls do
  @moduledoc """
  The Urls context.
  """

  import Ecto.Query, warn: false
  alias SernUrl.Repo

  alias SernUrl.Urls.ShortUrl

  @doc """
  Gets a single short_url.

  Raises `Ecto.NoResultsError` if the Short url does not exist.

  ## Examples

      iex> get_short_url!(123)
      %ShortUrl{}

      iex> get_short_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_short_url!(hash), do: Repo.get_by!(ShortUrl, hash: hash)

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
  Creates an empty short_url changeset.

  ## Examples

      iex> short_url_changeset()
      {:ok, %ShortUrl{}}

  """
  def short_url_changeset() do
    %ShortUrl{}
    |> ShortUrl.changeset()
  end
end
