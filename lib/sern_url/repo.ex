defmodule SernUrl.Repo do
  use Ecto.Repo,
    otp_app: :sern_url,
    adapter: Ecto.Adapters.Postgres
end
