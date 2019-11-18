### To run ALL tests from command line:
`elixir -r <file name>.exs test/<same file name>_test.exs`

> example:
```
elixir -r 1_string_peeler.exs test/1_string_peeler_test.exs
```

### To test individual function:

> example:
```
❯ iex 1_string_peeler.exs

Erlang/OTP 22 [erts-10.4.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]
warning: redefining module StringPeeler (current version loaded from Elixir.StringPeeler.beam)
  1_string_peeler.exs:1
Interactive Elixir (1.9.0) - press Ctrl+C to exit (type h() ENTER for help)

iex(1)> StringPeeler.del_first_last_1("wow")
"o"

iex(2)> StringPeeler.del_first_last_1("wo") 
"length of a string should be more then two characters!"

iex(3)> StringPeeler.del_first_last_1("w") 
"length of a string should be more then two characters!"

```
