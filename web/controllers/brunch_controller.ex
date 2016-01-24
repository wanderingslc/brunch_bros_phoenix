defmodule BrunchBrosPhoenix.BrunchController do
  use BrunchBrosPhoenix.Web, :controller

  alias BrunchBrosPhoenix.Brunch

  plug :scrub_params, "brunch" when action in [:create, :update]

  def index(conn, _params) do
    brunchs = Repo.all(Brunch)
    render(conn, "index.html", brunchs: brunchs)
  end

  def new(conn, _params) do
    changeset = Brunch.changeset(%Brunch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"brunch" => brunch_params}) do
    changeset = Brunch.changeset(%Brunch{}, brunch_params)

    case Repo.insert(changeset) do
      {:ok, _brunch} ->
        conn
        |> put_flash(:info, "Brunch created successfully.")
        |> redirect(to: brunch_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    brunch = Repo.get!(Brunch, id)
    render(conn, "show.html", brunch: brunch)
  end

  def edit(conn, %{"id" => id}) do
    brunch = Repo.get!(Brunch, id)
    changeset = Brunch.changeset(brunch)
    render(conn, "edit.html", brunch: brunch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "brunch" => brunch_params}) do
    brunch = Repo.get!(Brunch, id)
    changeset = Brunch.changeset(brunch, brunch_params)

    case Repo.update(changeset) do
      {:ok, brunch} ->
        conn
        |> put_flash(:info, "Brunch updated successfully.")
        |> redirect(to: brunch_path(conn, :show, brunch))
      {:error, changeset} ->
        render(conn, "edit.html", brunch: brunch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    brunch = Repo.get!(Brunch, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(brunch)

    conn
    |> put_flash(:info, "Brunch deleted successfully.")
    |> redirect(to: brunch_path(conn, :index))
  end
end
