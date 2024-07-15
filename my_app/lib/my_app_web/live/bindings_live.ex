defmodule MyAppWeb.BindingsLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(counter: 0)
      |> assign(name: "Counter")

    {:ok, socket}
  end

  def handle_event("inc", _params, socket) do
    {:noreply, update(socket, :counter, fn count -> count + 1 end)}
  end

  def handle_event("change", %{"email" => email}, socket) do
    dbg(email)
    {:noreply, socket}
  end
end
