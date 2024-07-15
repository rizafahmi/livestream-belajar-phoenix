defmodule Counter do
  use Phoenix.LiveComponent
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div>
      <p>Click the button to increment the counter: <%= @counter %></p>
      <div class="container">
        <p>Loading...</p>
      </div>
      <button phx-click={JS.push("inc", target: @myself, loading: ".container")}>
        Increment
      </button>
    </div>
    """
  end

  def handle_event("inc", _params, socket) do
    dbg("MYSELF")
    {:noreply, update(socket, :counter, fn count -> count + 1 end)}
  end
end
