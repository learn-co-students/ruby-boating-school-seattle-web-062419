class BoatingTest
    attr_accessor :student,:testname,:status,:instructor
    @@all=[]
    def initialize(student,testname,status,instructor)
        @student=student
        @testname=testname
        @status=status
        @instructor=instructor
        @@all<<self
    end

    def self.all
        @@all
    end
end
