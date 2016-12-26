defmodule HelloplugTest do
  use ExUnit.Case, async: true
  use Plug.Test
  doctest Helloplug

  test "parses the query string for an id" do
    conn = conn(:get, "/topic?id=123")
    opts = Helloplug.init([])
    conn = Helloplug.call(conn, opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "topic id: 123"
  end

  test "fetches user from database" do
    conn = conn(:get, "/users/2")
    opts = Helloplug.init([])
    conn = Helloplug.call(conn, opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "doesn't fetch user from database" do
    conn = conn(:get, "/users/2123123")
    opts = Helloplug.init([])
    conn = Helloplug.call(conn, opts)

    assert conn.state == :sent
    assert conn.status == 404
  end
end
