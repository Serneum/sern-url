# SernUrl

## Notes

I opted to use an md5 hash for the shortened URL. I had considered using phrases or random strings but the md5 hash was the quickest to implement. It did, however, lead to some odd followup decisions, like needing to make URLs unique in the database. I figured the trade-off of shared shortened URLs across multiple users would be okay. A solution to this would be to have actual accounts, then the URLs could be unique per user.

## Run the server

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
