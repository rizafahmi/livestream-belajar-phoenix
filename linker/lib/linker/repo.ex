defmodule Linker.Repo do
  use Ecto.Repo,
    otp_app: :linker,
    adapter: Ecto.Adapters.SQLite3
end
