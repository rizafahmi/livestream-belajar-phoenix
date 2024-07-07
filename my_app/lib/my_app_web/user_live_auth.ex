defmodule MyAppWeb.UserLiveAuth do
  import Phoenix.Component
  import Phoenix.LiveView

  def on_mount(:default, _params, %{"user_token" => user_token} = session, socket) do
    socket =
      socket
      |> assign_new(:current_user, fn ->
        MyApp.Account.get_user_by_session_token(user_token)
      end)

    if socket.assigns.current_user.confirmed_at do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/users/log_in")}
    end
  end
end
