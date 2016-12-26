# Helloplug

Basic Elixir webserver example built with Plug and Cowboy libraries for learning purposes.

To run: `iex -S mix`, then `iex> Plug.Adapters.Cowboy.http Helloplug, []`

Can run tests with `mix test` (will need to populate database first)

Server will then be running on `localhost:4000`

Adapted from [here](https://codewords.recurse.com/issues/five/building-a-web-framework-from-scratch-in-elixir).