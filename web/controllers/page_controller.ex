defmodule BrunchBrosPhoenix.PageController do
  use BrunchBrosPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
