defmodule Defcurry do
  @moduledoc """
  Documentation for `Defcurry`.
  """

  @doc """
  Defining a sum example function.

  defmodule Emm do
    import Defcurry

    defcurry sum3(a, b, c) do
      a + b + c
    end

    defcurry sum2(a, b) do
      a + b
    end

    defcurry sum2(a) do
      a + 1
    end
  end

  ## Examples

      iex> f =  DefcurryExample.sum3(2)
      iex> f1 =  f.(3)
      iex> f1.(4)
      9

  """
  defmacro defcurry(definition, do: body) do
    fns = make_fun(definition, [], body)

    quote do
      unquote(fns)
    end
  end

  defp make(definition, body), do: quote(do: def(unquote(definition), do: unquote(body)))
  defp make_fun({_, _, []} = a, [], body), do: make(a, body)
  defp make_fun({_, _, [_]} = a, [], body), do: make(a, body)

  defp make_fun({fname, ctx, [_ | _] = a}, [], body) do
    [
      {fname, ctx, a} |> make(deflocalcurry([], body))
      | {fname, ctx, a |> Enum.drop(-1)} |> make_fun(a |> Enum.drop(length(a) - 1), body)
    ]
  end

  # a, b       c
  defp make_fun({fname, ctx, [_] = a}, acc, body) do
    [{fname, ctx, a} |> make(deflocalcurry(acc, body))]
  end

  defp make_fun({fname, ctx, [_ | _] = a}, acc, body) do
    [
      {fname, ctx, a} |> make(deflocalcurry(acc, body))
      | {fname, ctx, a |> Enum.drop(-1)} |> make_fun((a |> Enum.drop(length(a) - 1)) ++ acc, body)
    ]
  end

  defp deflocalcurry([], body) do
    quote do
      unquote(body)
    end
  end

  defp deflocalcurry([h], body) do
    quote do
      fn unquote(h) ->
        unquote(body)
      end
    end
  end

  defp deflocalcurry([h | t], body) do
    quote do
      fn unquote(h) ->
        unquote(t |> deflocalcurry(body))
      end
    end
  end
end
