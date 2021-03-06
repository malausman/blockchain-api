defmodule BlockchainAPIWeb.StatsController do
  use BlockchainAPIWeb, :controller

  alias BlockchainAPIWeb.StatsView
  alias BlockchainAPI.Query.Stats

  import BlockchainAPI.Cache.CacheService

  action_fallback BlockchainAPIWeb.FallbackController

  def show(conn, _params) do
    stats = Stats.list()

    conn
    |> put_cache_headers(ttl: :medium)
    |> put_view(StatsView)
    |> render("show.json", stats: stats)
  end
end
