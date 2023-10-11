require 'rspec'
require_relative 'classroom'
require_relative 'student'

describe Classroom do
  let(:classroom) { Classroom.new('Classroom 1') }
  let(:student) { Student.new('John Doe', 'Math', 15) }

  context '#label' do
    it 'returns the classroom label' do
      expect(classroom.label).to eq('Classroom 1')
    end
  end

  context '#attr_accesor' do
    it 'label instance can be changed' do
      classroom.label = 'new label'
      expect(classroom.label).to eq('new label')
    end

    context '#students' do
      it 'returns an empty array by default' do
        expect(classroom.students).to be_empty
      end
    end

    context '#add_student' do
      it 'adds a student to the classroom' do
        classroom.add_student(student)
        expect(classroom.students).to include(student)
      end

      it 'sets the student classroom to the classroom' do
        classroom.add_student(student)
        expect(student.classroom).to eq(classroom)
      end
    end
  end
end
