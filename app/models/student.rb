class Student
    attr_accessor :first_name
    @@all=[]
    def initialize(first_name)
        @first_name = first_name
        @@all<<self
    end

    def self.all
        @@all
    end

    def add_boating_test(testname,status,instructor)
        BoatingTest.new(self,testname,status,instructor)
    end

    def self.find_student(first_name)
        @@all.select do |student|
            student.first_name==first_name
        end
    end

    def total_test
        BoatingTest.all.select do |test|
            test.student == self
        end
    end
    
    def grade_percentage
        testnum= self.total_test.size.to_f
        passed_test=self.total_test.select do |test|
            test.status == "passed"
        end
        if testnum==0
            return 0
        else
            return (passed_test.size.to_f/testnum.to_f)*100
        end
    end
    
end
