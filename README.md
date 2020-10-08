# Defcurry

Currying any function in Elixir

## Use example

```elixir
defmodule DefcurryExample do
  import Defcurry

  defcurry sum3(a, b, c) do
    a + b + c
  end
end
```

CLI use,

```sh
iex -S mix
Erlang/OTP 23 [erts-11.0.2] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe
] [dtrace]

Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> f = DefcurryExample.sum3(1)
#Function<1.39673905/1 in DefcurryExample.sum3/1>
iex(2)> f1 = f.(2)
#Function<3.39673905/1 in DefcurryExample.sum3/1>
iex(3)> f2 = f1.(3)
6
````
  


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `defcurry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:defcurry, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/defcurry](https://hexdocs.pm/defcurry).

