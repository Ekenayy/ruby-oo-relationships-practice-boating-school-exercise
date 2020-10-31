require_relative './boatingtest.rb'
require_relative './instructor.rb'
require_relative './student.rb'

puts "Testing Students init"
spongebob = Student.new("Spongebob")
puts spongebob
patrick= Student.new("Patrick")
puts patrick 
ekene = Student.new("Ekene")
puts ekene
odera = Student.new("Odera")
puts "\n\n"

puts "Testing Instructors init"
puff= Instructor.new("Ms.Puff")
puts puff
puts "Ms. Puff"
krabs= Instructor.new("Mr.Krabs")
puts krabs
puts "\n\n"

puts "Testing add_boating_test"
no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
puts no_crashing
puts power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
puts power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)
puts right_turn_pass = ekene.add_boating_test("Right Turn 101", "passed", puff)
puts new_tests =  ekene.add_boating_test("Right Turn 201", "passed", puff)
puts no_dashing = odera.add_boating_test("Don't Dash 101", "failed", puff)
puts "\n\n"

puts "Testing all_instructors"
puts spongebob.all_instructors 
puts "Should be Ms.Puff"

puts "Should output Patrick object"
Student.find_student("Patrick")
puts Student.find_student("Patrick")
puts "Should output Ekene object"
puts Student.find_student("Ekene")
puts "\n\n"

puts "Testing Grade percentage"
puts patrick.grade_percentage
puts "\n\n"



puts "Testing Instructor tests"
puts puff.tests
puts "\n\n"

puts "Passing a student test"
puts no_dashing.status
puff.pass_student(odera, "Don't Dash 101")
puts no_dashing.status
puts "Should return the name of the new test if it's been made"
puts puff.pass_student(patrick, "This is a passed test").name
puts "\n\n"

puts "Testing insructor all students"
puts puff.all_students

puts "Testing fail student"
puts ekene.grade_percentage
puts new_tests.status
puff.fail_student(ekene, "Right Turn 201")
puts new_tests.status
puts "Should return the name of the new test"
puts puff.fail_student(odera, "This is a failed test").name

puts "Testing passed students"
puts puff.passed_students 
puts "\n\n"