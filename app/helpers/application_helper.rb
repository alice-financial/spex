module ApplicationHelper
  def some_method_to_test
    'result'
  end

  def some_method_i_missed
    'no safety net!'
  end

  def some_method_with_conditionals(say_yes)
    if say_yes
      'yes'
    else
      'no'
    end
  end

  def some_method_with_ternary(say_yes)
    say_yes ? 'yes' : 'no'
  end
end
