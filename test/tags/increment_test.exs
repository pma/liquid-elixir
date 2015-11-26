Code.require_file "../../test_helper.exs", __ENV__.file

defmodule Liquescent.IncrementTest do
  use ExUnit.Case
  alias Liquescent.Templates

  setup_all do
    Liquescent.start
    :ok
  end

  test :test_inc do
    assert_template_result("0", "{%increment port %}", [])
    assert_template_result("0 1", "{%increment port %} {%increment port%}", [])
    assert_template_result("0 0 1 2 1","""
      {%increment port %} {%increment starboard%}
      {%increment port %} {%increment port%}
      {%increment starboard %}
      """, [])
  end

  test :test_dec do
    assert_template_result("9", "{%decrement port %}", [ port: 10 ])
    assert_template_result("-1 -2", "{%decrement port %} {%decrement port%}", [])
    assert_template_result("1 5 2 2 5","""
      {%increment port %} {%increment starboard%}
      {%increment port %} {%decrement port%}
      {%decrement starboard %}
      """, [port: 1, starboard: 5 ])
  end


  defp assert_template_result(expected, markup) do
    assert_result(expected, markup, [])
  end

  defp assert_template_result(expected, markup, assigns) do
    assert_result(expected,markup,assigns)
  end

  defp assert_result(expected, markup, assigns) do
    template = Templates.parse(markup)
    { :ok, result, _ } = Templates.render(template, assigns)
    assert result == expected
  end
end