class CapitalizeDecorator < NameDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end