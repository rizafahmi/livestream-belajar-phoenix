defmodule MyAppWeb.FormBindingLive do
  use MyAppWeb, :live_view
  alias MyApp.Blog.Post

  def mount(_params, _session, socket) do
    form = %Post{} |> Ecto.Changeset.change() |> to_form()

    socket =
      socket
      |> assign(form: form)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h2>
      Form Binding
    </h2>
    <.form for={@form} phx-change="validate" phx-submit="save">
      <.input field={@form[:title]} type="text" label="Title" />
      <.button phx-disable-with="Saving...">Save Post</.button>
    </.form>
    """
  end

  def handle_event("validate", %{"post" => post_params}, socket) do
    dbg(post_params)
    form = %Post{} |> Ecto.Changeset.change(post_params) |> to_form(action: :validate)
    {:noreply, assign(socket, form: form)}
  end
end
