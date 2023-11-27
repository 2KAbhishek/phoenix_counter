defmodule PhoenixCounterWeb.Counter do
  use PhoenixCounterWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _, socket) do
    {:noreply, assign(socket, count: socket.assigns.count + 1)}
  end

  def handle_event("decrement", _, socket) do
    {:noreply, assign(socket, count: max(0, socket.assigns.count - 1))}
  end

  def handle_event("clear", _, socket) do
    {:noreply, assign(socket, count: 0)}
  end
end
