defmodule Countdown.PageControllerTest do
  use Countdown.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    html = html_response(conn, 200)

    refute html |> Floki.find("#counter") |> Enum.empty?
    refute html |> Floki.find("ul#trophies") |> Enum.empty?
  end
end
