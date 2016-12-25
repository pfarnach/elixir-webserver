defmodule Helloplug do

	import Plug.Conn
	use Router

	def init(default_opts) do
		IO.puts "starting up Helloplug..."
		default_opts
	end

	# def call(conn, _opts) do
	# 	IO.puts "saying hello!!"
	# 	send_resp(conn, 200, "Hello, world!!!")
	# end

	def call(conn, _opts) do
	  route(conn.method, conn.path_info, conn)
	end

	def route("GET", [], conn) do
	  # this route is for /hello
	  conn |> send_resp(200, "Hello, world 1")
	end

	def route("GET", ["hello"], conn) do
	  # this route is for /hello
	  conn |> send_resp(200, "Hello, world 2")
	end

	def route("GET", ["users", user_id], conn) do
	  # this route is for /users/<user_id>
	  conn |> send_resp(200, "You requested user #{user_id}")
	end

	def route("GET", ["topic"], conn) do
	  # this route is for /topic?id=???
	  %{ params: params } = fetch_query_params conn

	  conn |> send_resp(200, "You requested topic #{params["id"] || "not defined"}")
	end

	def route(_method, _path, conn) do
	  # this route is called if no other routes match
	  conn |> send_resp(404, "Couldn't find that page, sorry!")
	end
end
