defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  plug :introspect when action in [:show]

  def show(conn, %{"messenger" => messenger} = _params) do
    conn
    |> assign(:messenger, messenger)
    |> assign(:username, nil)
    |> put_root_layout(false)
    |> render(:show)
  end

  def introspect(conn, _opts) do
    IO.puts """
    Verb: #{conn.method}
    Host: #{conn.host}
    Headers: #{inspect(conn.req_headers)}
    """

    conn
  end
end
