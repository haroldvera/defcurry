defmodule DefcurryTest do
  use ExUnit.Case
  doctest Defcurry

  test "currying arity 3" do
    f = DefcurryExample.sum3(1)
    f1 = f.(2)
    assert(f1.(3) == 6)
  end

  test "currying arity 2" do
    f = DefcurryExample.sum3(1, 2)
    assert(f.(3) == 6)
  end

  test "curry arity 3" do
    assert DefcurryExample.sum3(1, 2, 3) == 6
  end

  test "curry arity 2" do
    assert DefcurryExample.sum2(1, 2) == 3
  end

  test "curry arity 1" do
    assert DefcurryExample.sum1(1) == 1
  end

  test "curry arity 0" do
    assert DefcurryExample.sum0() == 0
  end
end
