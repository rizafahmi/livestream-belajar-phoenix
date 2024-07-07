defmodule HelloWeb.PageController do
  use HelloWeb, :controller
  plug :put_view, html: HelloWeb.PageHTML, json: HelloWeb.PageJSON

  def index(conn, _params) do
    conn
    |> put_flash(:error, "Let's pretend that we have an error")
    |> redirect(to: "/hello/someone")
  end

end
