defmodule SernUrl.Repo.Migrations.CreateShortUrls do
  use Ecto.Migration

  def change do
    create table(:short_urls) do
      add :url, :string
      add :hash, :string

      timestamps()
    end

  end
end
