defmodule LinkerWeb.LinkLive.Index do
  use LinkerWeb, :live_view

  def mount(_params, _session, socket) do
    user_id = socket.assigns.current_user.id
    changeset = Linker.Links.Link.changeset(%Linker.Links.Link{})

    socket =
      socket
      |> assign(:links, Linker.Links.list_links(user_id))
      |> assign(:form, to_form(changeset))

    {:ok, socket}
  end

  def handle_event("submit", %{"link" => link_params}, socket) do
    IO.puts("Ini di server")

    params =
      link_params
      |> Map.put("user_id", socket.assigns.current_user.id)

    case Linker.Links.create_link(params) do
      {:ok, _link} ->
        socket =
          socket
          |> put_flash(:info, "Link created successfully")
          |> push_navigate(to: ~p"/links")

        {:noreply, socket}

      {:error, changeset} ->
        socket =
          socket
          |> assign(:form, to_form(changeset))

        {:noreply, socket}
    end
  end
end
