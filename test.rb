require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'

student1 = Student.new('Unknown', 13, 'Mahdi')
student2 = Student.new('Unknown', 17, 'Noel')
student3 = Student.new('Unknown', 14, 'Joel')

class1 = Classroom.new('Literature & Travels')

book1 = Book.new('Learn JavaScript', 'Author1')
book2 = Book.new('Learn React', 'Author2')
book3 = Book.new('Learrn Ruby', 'Author3')

Rental.new('2017-12-07', book1, student1)
Rental.new('2018-03-07', book2, student2)
Rental.new('2019-08-07', book2, student1)
Rental.new('2022-02-09', book3, student3)

puts class1.add_student(student1)
puts student1.classroom.label
puts student2.classroom
puts class1.students.count
puts student2.classroom = class1
puts class1.students.count

puts book1.rentals
puts book2.rentals
puts book3.rentals

puts student1.rentals.count
puts student2.rentals.count
puts student3.rentals.count
puts book1.rentals.count
puts book2.rentals.count
puts book3.rentals.count
