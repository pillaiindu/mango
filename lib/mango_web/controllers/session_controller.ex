defmodule MangoWeb.SessionController do
  use MangoWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => session_params}) do
    
  end
end