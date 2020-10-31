require 'pry'

class Student

    #Student#add_boating_test should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object). -- Done 
  #Student#all_instructors should return an array of instructors with whom this specific student took a boating test.  -- done 
  #Student.find_student will take in a first name and output the student (Object) with that name -- done 
  #Student#grade_percentage should return the percentage of tests that the student has passed, a Float (so if a student has passed
  # 3 / 9 tests that they've taken, this method should return the Float 33.33) -- done 
  
    attr_accessor :first_name
  
    @@all = []
  
    def self.all
      @@all
    end 
    
    def initialize(first_name)
      @first_name = first_name
      @@all << self
    end 
  
    
  
    def add_boating_test(name, status, instructor)
      BoatingTest.new(self, name, status, instructor)
    end 
  
    #Shouls return instructors -- not boating tests
    def all_instructors 
     student_tests = BoatingTest.all.select {|test| test.student == self}
    instructors = student_tests.map {|test2| test2.instructor}
    #binding.pry
    instructors
    end 
  
    #We want the object not the name 
    def self.find_student(first_name)
      @@all.select {|student| student.first_name == first_name}
    end 
  
    #iterate into BoatingTest array and look at status
    #Divide tests with status "pass" by the length of the student_tests array
    def grade_percentage
      student_tests = BoatingTest.all.select {|test| test.student == self}
      passes = student_tests.count {|tests| tests.status == "passed"}
      grade_percentage = ((passes.to_f / student_tests.length.to_f).round(2)) * 100
      #binding.pry 
      grade_percentage.to_f
    end 
  
  end
  
