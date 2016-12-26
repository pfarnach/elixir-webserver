defmodule Helloplug do

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Helloplug.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Helloplug.Supervisor]
    Supervisor.start_link(children, opts)
  end

	import Plug.Conn
	use Router

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
	  # conn |> send_resp(200, "You requested user #{user_id}")

	  case Helloplug.Repo.get(User, user_id) do
	  	nil -> conn |> send_resp(404, "User with id of #{user_id} doesn't exist")
	  	user -> conn |> send_resp(200, "First name: #{user.first_name} \nLast name: #{user.last_name}")
	  end
	end

	def route("GET", ["topic"], conn) do
	  # this route is for /topic?id=???
	  %{ params: params } = fetch_query_params conn

	  conn |> send_resp(200, "topic id: #{params["id"] || "not defined"}")
	end

	def route(_method, _path, conn) do
	  # this route is called if no other routes match
	  conn |> send_resp(404, "Couldn't find that page, sorry!")
	end
end
