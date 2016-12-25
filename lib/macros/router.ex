defmodule Router do
  defmacro __using__(_opts) do
    quote do
      def init(options) do
        options
      end
      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

  # def init(default_opts) do
  #   IO.puts "starting up Helloplug..."
  #   default_opts
  # end

  # # def call(conn, _opts) do
  # #   IO.puts "saying hello!!"
  # #   send_resp(conn, 200, "Hello, world!!!")
  # # end

  # def call(conn, _opts) do
  #   route(conn.method, conn.path_info, conn)
  # end