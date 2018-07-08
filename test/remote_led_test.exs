defmodule RemoteLedTest do
  use ExUnit.Case
  doctest RemoteLed

  test "greets the world" do
    assert RemoteLed.hello() == :world
  end
end
