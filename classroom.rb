class Classroom
  attr_accessor :label

  has_many :student

  def initialize(label)
    @label = label
  end

  def add_book(student)
    student.classroom = self
    student << student
  end
end