defmodule PhoenixCounterWeb.PageLiveTest do
  use PhoenixCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page, html} = live(conn, "/")
    assert html =~ "0"
    assert render(page) =~ "0"
  end

  def "increment and decrement", %{conn: conn} do
    {:ok, page, _html} = live(conn, "/")
    asserd(render_click(page, :inc, %{}) =~ "1")
    asserd(render_click(page, :inc, %{}) =~ "2")
    asserd(render_click(page, :inc, %{}) =~ "3")
    asserd(render_click(page, :dec, %{}) =~ "2")
    asserd(render_click(page, :dec, %{}) =~ "1")
    asserd(render_click(page, :dec, %{}) =~ "0")
  end
end
