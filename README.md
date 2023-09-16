# HdDoctest

Reproduces a limitation with multiline exceptions in doctests

To reproduce run:
- `mix test`

This will result in an error like:
```
  1) doctest module HdDoctest (1) (HdDoctestTest)
     test/hd_doctest_test.exs:3
     Doctest failed: wrong message for ArgumentError
     expected:
       ""
     actual:
       "errors were found at the given arguments:\n\n  * 1st argument: not a nonempty list\n"
     doctest:
       iex> hd([])
       ** (ArgumentError)
     stacktrace:
       lib/hd_doctest.ex:4: HdDoctest (module)
```

But if you changing the expected error to not include the double newline results in the text after the newline being ignored:
```elixir
iex> hd([])
** (ArgumentError) errors were found at the given arguments:\n\n  * 1st argument: not a nonempty list
```

```
  1) doctest module HdDoctest (1) (HdDoctestTest)
     test/hd_doctest_test.exs:3
     Doctest failed: wrong message for ArgumentError
     expected:
       "errors were found at the given arguments:"
     actual:
       "errors were found at the given arguments:\n\n  * 1st argument: not a nonempty list\n"
     doctest:
       iex> hd([])
       ** (ArgumentError) errors were found at the given arguments:
     stacktrace:
       lib/hd_doctest.ex:4: HdDoctest (module)
```

And _some_ message is expected, if you try with:
```elixir
iex> hd([])
** (ArgumentError)
```

Then you get the error:
```
  1) doctest module HdDoctest (1) (HdDoctestTest)
     test/hd_doctest_test.exs:3
     Doctest failed: wrong message for ArgumentError
     expected:
       ""
     actual:
       "errors were found at the given arguments:\n\n  * 1st argument: not a nonempty list\n"
     doctest:
       iex> hd([])
       ** (ArgumentError)
     stacktrace:
       lib/hd_doctest.ex:4: HdDoctest (module)
```
