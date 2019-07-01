defmodule ServiceProviderTest do
  use ExUnit.Case
  doctest ServiceProvider

  test "greets the world" do
    assert ServiceProvider.hello() == :world
  end
end
