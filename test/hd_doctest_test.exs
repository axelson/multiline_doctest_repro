defmodule HdDoctestTest do
  use ExUnit.Case
  doctest HdDoctest

  test "greets the world" do
    assert HdDoctest.hello() == :world
  end
end
