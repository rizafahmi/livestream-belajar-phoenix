defmodule MyAppWeb.ThermostatLive do
  use MyAppWeb, :live_view

  def render(assigns) do
    ~H"""
    <div phx-window-keyup="update_temp">
      Current temperature: <%= @temperature %>°F <button phx-click="inc_temperature">+</button>
    </div>
    <hr />
    <.link href={~p"/posts"}>Href Posts</.link>
    <.link navigate="https://rizafahmi.com">Navigate Posts</.link>
    <.link patch={~p"/posts"}>Patch Posts</.link>
    <hr />
    <.link patch={~p"/thermostat?temperature=99"}>Set Temp to 99</.link>
    <.live_component module={MyAppWeb.HeroComponent} id="hero" />
    """
  end

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(temperature: 72)

    {:ok, socket}
  end

  def handle_event("inc_temperature", _value, socket) do
    temperature = socket.assigns.temperature
    socket = socket |> assign(:page_title, "Temperature: #{temperature + 1}°F")
    {:noreply, update(socket, :temperature, fn temp -> temp + 1 end)}
  end

  def handle_event("update_temp", %{"key" => "ArrowUp"}, socket) do
    {:noreply, update(socket, :temperature, fn temp -> temp + 1 end)}
  end

  def handle_event("update_temp", %{"key" => "ArrowDown"}, socket) do
    {:noreply, update(socket, :temperature, fn temp -> temp - 1 end)}
  end

  def handle_event("update_temp", _, socket), do: {:noreply, socket}

  def handle_params(%{"temperature" => temp}, _url, socket) do
    {:noreply, update(socket, :temperature, fn _ -> String.to_integer(temp) end)}
  end

  def handle_params(_, _, socket), do: {:noreply, socket}
end
