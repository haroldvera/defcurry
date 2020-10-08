defmodule DefcurryExample do
  import Defcurry

  defcurry sum3(a, b, c) do
    a + b + c
  end

  defcurry sum2(a, b) do
    a + b
  end

  defcurry sum1(a) do
    a + 0
  end

  defcurry sum0() do
    0
  end
end
