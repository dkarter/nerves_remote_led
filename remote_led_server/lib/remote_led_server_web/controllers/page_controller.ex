defmodule RemoteLedServerWeb.PageController do
  use RemoteLedServerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
