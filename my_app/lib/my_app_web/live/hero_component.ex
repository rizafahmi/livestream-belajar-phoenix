defmodule MyAppWeb.HeroComponent do
  use Phoenix.LiveComponent

  @impl true
  def render(assigns) do
    ~H"""
    <div class="hero">Hero section</div>
    """
  end
end
