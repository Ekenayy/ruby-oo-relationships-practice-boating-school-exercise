class Instructor
#Instructor#passed_students should return an array of students who passed a boating test with this specific instructor. -- Done 

#Instructor#pass_student should take in a student instance and test name. If there is a BoatingTest whose name and student match the values passed in,
 #this method should update the status of that BoatingTest to 'passed'. If there is no matching test, this method should create a test with the student, that boat test name, and the status 'passed'. 
 #Either way, it should return the BoatingTest instance. -- Done 

#Instructor#fail_student should take in a student instance and test name. Like #pass_student, 
#it should try to find a matching BoatingTest and update its status to 'failed'. 
#If it cannot find an existing BoatingTest, it should create one with the 
#name, the matching student, and the status 'failed'. -- Done 

#Instructor#all_students should return an array of students who took a boating test with this specific instructor. -- Done 
attr_accessor :name

@@all = []

def self.all
  @@all
end 


def pass_student(student, test)
    count = 0
    BoatingTest.all.map do |t1| 
        if t1.student.first_name == student.first_name && t1.name == test && t1.status != "passed"
            t1.status = "passed"
            count += 1
            #binding.pry  
        end 
    end 

    if count = 0 
        BoatingTest.new(student, test, "passed", self)
    end 
end 

def fail_student(student, test)
    count = 0
    BoatingTest.all.map do |t1| 
        if t1.student.first_name == student.first_name && t1.name == test && t1.status != "failed"
            t1.status = "failed"
            count += 1
        end 
    end 

    if count = 0
        BoatingTest.new(student, test, "failed", self)
    end 
end 

def initialize(name)
  @name = name
  @@all << self
end 

def tests
    BoatingTest.all.select {|test| test.instructor == self}
end 

def all_students
    students = self.tests.map {|test| test.student}
    students.uniq
    #binding.pry
end 
#returns an array of students
def passed_students 
    students = self.tests.map do |test1| 
       if test1.status == "passed"
        test1.student.first_name
        #binding.pry
       end
    end 
    students.uniq
     #binding.pry
end 

end
