defmodule Countdown.PageController do
  use Countdown.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
