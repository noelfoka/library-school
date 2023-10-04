class CapitalizeDecorator < NameDecorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end
