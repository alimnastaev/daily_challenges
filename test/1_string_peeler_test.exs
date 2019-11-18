ExUnit.start()

defmodule StringPeelerTest do
  use ExUnit.Case

  describe "testing all functions" do
    test "#1" do
      assert StringPeeler.del_first_last_1("wow") == "o"
      assert StringPeeler.del_first_last_1("weeeeeeew") == "eeeeeee"
      refute StringPeeler.del_first_last_1("wo") == "o"
      refute StringPeeler.del_first_last_1("w") == "o"

      assert(
        StringPeeler.del_first_last_1("w") ==
          "length of a string should be more then two characters!"
      )

      assert(
        StringPeeler.del_first_last_1("wo") ==
          "length of a string should be more then two characters!"
      )
    end

    test "#2" do
      assert StringPeeler.del_first_last_2("wow") == "o"
      assert StringPeeler.del_first_last_2("weeeeeeew") == "eeeeeee"
      refute StringPeeler.del_first_last_2("wo") == "o"
      refute StringPeeler.del_first_last_2("w") == "o"

      assert(
        StringPeeler.del_first_last_2("w") ==
          "length of a string should be more then two characters!"
      )

      assert(
        StringPeeler.del_first_last_2("wo") ==
          "length of a string should be more then two characters!"
      )
    end

    test "#3" do
      assert StringPeeler.del_first_last_3("weeeeeeew") == "eeeeeee"
      assert StringPeeler.del_first_last_3("wow") == "o"

      # https://hexdocs.pm/ex_unit/ExUnit.Assertions.html#assert_raise/3
      assert_raise RuntimeError, fn ->
        StringPeeler.del_first_last_3("o")
      end

      assert_raise RuntimeError, fn ->
        StringPeeler.del_first_last_3("oo")
      end
    end

    test "#4" do
      assert StringPeeler.del_first_last_4("wow") == "o"
      assert StringPeeler.del_first_last_4("weeeeeeew") == "eeeeeee"
      refute StringPeeler.del_first_last_4("wo") == "o"
      refute StringPeeler.del_first_last_4("w") == "o"

      assert(
        StringPeeler.del_first_last_4("w") ==
          "length of a string should be more then two characters!"
      )

      assert(
        StringPeeler.del_first_last_4("wo") ==
          "length of a string should be more then two characters!"
      )
    end

    test "#5" do
      assert StringPeeler.del_first_last_5("wow") == "o"
      assert StringPeeler.del_first_last_5("weeeeeeew") == "eeeeeee"
      refute StringPeeler.del_first_last_5("wo") == "o"
      refute StringPeeler.del_first_last_5("w") == "o"

      assert(
        StringPeeler.del_first_last_5("w") ==
          "length of a string should be more then two characters!"
      )

      assert(
        StringPeeler.del_first_last_5("wo") ==
          "length of a string should be more then two characters!"
      )
    end
  end
end
