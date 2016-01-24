defmodule BrunchBrosPhoenix.BrunchTest do
  use BrunchBrosPhoenix.ModelCase

  alias BrunchBrosPhoenix.Brunch

  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Brunch.changeset(%Brunch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Brunch.changeset(%Brunch{}, @invalid_attrs)
    refute changeset.valid?
  end
end
