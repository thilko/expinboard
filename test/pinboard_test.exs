defmodule PinboardTest do
  use ExUnit.Case

  test "fetch returns all bookmarks" do
    bookmarks = Pinboard.all(System.get_env("PINBOARD_API_TOKEN"), [limit: 50])
    assert length(bookmarks) == 50
  end

  @tag timeout: 1000000
  test "fetch broken bookmarks" do
    bookmarks = Pinboard.broken(System.get_env("PINBOARD_API_TOKEN"), [limit: 50])
    status = Enum.map(bookmarks, fn({url, status}) -> status end)

    assert Enum.all?(status, fn(s) -> s >= 300 end)
  end

end
