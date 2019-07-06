class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name
        @@all << self
    end

    def pass_student(student, test_name)
        BoatingTest.all.find { |test|
            if test.test_name == test_name
                test.test_status = "passed"
            else
                BoatingTest.new(student, test_name, "passed", self)
            end
        }
    end

    def fail_student(student, test_name)
        BoatingTest.all.find { |test|
        if test.test_name == test_name
            test.test_status = "failed"
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    }
    end

    def self.all
        @@all
    end

end


# Instructor.all should return all instructors

# Instructor #pass_student should take in a student instance and test name. If there is a 
# BoatingTest whose name and student match the values passed in, this method should update 
# the status of that BoatingTest to 'passed'. 
# If there is no matching test, this method should create a test with the student, 
# that boat test name, and the status 'passed'. Either way, it should return the BoatingTest instance.

# Instructor #fail_student should take in a student instance and test name. Like #pass_student, 
# it should try to find a matching BoatingTest and update its status to 'failed'. 
# If it cannot find an existing BoatingTest, it should create one with the name, 
# the matching student, and the status 'failed'.