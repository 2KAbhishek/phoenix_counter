defmodule PhoenixCounterWeb.PageLiveTest do
  use PhoenixCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconn_html} = live(conn, "/")
    assert disconn_html =~ "0"
    assert render(page_live) =~ "0"
  end
end
