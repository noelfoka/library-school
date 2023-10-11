require 'rspec'
require_relative 'student'
require_relative 'classroom'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(classroom, 16, 'Alice') }

  context 'student is initialized with data' do
    it 'should inherit age, name, and parent_permission from Person' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('Alice')
    end

    it 'should initialize a classroom' do
      expect(student.classroom).to eq(classroom)
    end
  end

  context 'attr accessors' do
    it 'classroom is changeable' do
      new_classroom = Classroom.new('History')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
    end
  end

  context 'methods' do
    it 'play_hooky method should return an emoji' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end