defmodule SernUrlWeb.PageControllerTest do
  use SernUrlWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Shorten a URL"
  end
end
