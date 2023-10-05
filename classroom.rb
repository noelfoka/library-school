class Classroom
  attr_accessor :label

  attr_reader :student

  def initialize(label)
    @label = label
  end

  def add_student(student)
    @student << student
    student.classroom = self
  end
end
