defmodule BrunchBrosPhoenix.BrunchControllerTest do
  use BrunchBrosPhoenix.ConnCase

  alias BrunchBrosPhoenix.Brunch
  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, brunch_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing brunchs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, brunch_path(conn, :new)
    assert html_response(conn, 200) =~ "New brunch"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, brunch_path(conn, :create), brunch: @valid_attrs
    assert redirected_to(conn) == brunch_path(conn, :index)
    assert Repo.get_by(Brunch, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, brunch_path(conn, :create), brunch: @invalid_attrs
    assert html_response(conn, 200) =~ "New brunch"
  end

  test "shows chosen resource", %{conn: conn} do
    brunch = Repo.insert! %Brunch{}
    conn = get conn, brunch_path(conn, :show, brunch)
    assert html_response(conn, 200) =~ "Show brunch"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, brunch_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    brunch = Repo.insert! %Brunch{}
    conn = get conn, brunch_path(conn, :edit, brunch)
    assert html_response(conn, 200) =~ "Edit brunch"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    brunch = Repo.insert! %Brunch{}
    conn = put conn, brunch_path(conn, :update, brunch), brunch: @valid_attrs
    assert redirected_to(conn) == brunch_path(conn, :show, brunch)
    assert Repo.get_by(Brunch, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    brunch = Repo.insert! %Brunch{}
    conn = put conn, brunch_path(conn, :update, brunch), brunch: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit brunch"
  end

  test "deletes chosen resource", %{conn: conn} do
    brunch = Repo.insert! %Brunch{}
    conn = delete conn, brunch_path(conn, :delete, brunch)
    assert redirected_to(conn) == brunch_path(conn, :index)
    refute Repo.get(Brunch, brunch.id)
  end
end
