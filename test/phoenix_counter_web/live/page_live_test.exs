defmodule PhoenixCounterWeb.PageLiveTest do
  use PhoenixCounterWeb.ConnCase
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page, html} = live(conn, "/")
    assert html =~ "0"
    assert render(page) =~ "0"
  end

  test "increment and decrement", %{conn: conn} do
    {:ok, page, _html} = live(conn, "/")
    assert(render_click(page, :inc, %{}) =~ "1")
    assert(render_click(page, :inc, %{}) =~ "2")
    assert(render_click(page, :inc, %{}) =~ "3")
    assert(render_click(page, :dec, %{}) =~ "2")
    assert(render_click(page, :dec, %{}) =~ "1")
    assert(render_click(page, :dec, %{}) =~ "0")
  end

  test "clear", %{conn: conn} do
    {:ok, page, _html} = live(conn, "/")
    assert(render_click(page, :inc, %{}) =~ "1")
    assert(render_click(page, :clear, %{}) =~ "0")
  end
end
