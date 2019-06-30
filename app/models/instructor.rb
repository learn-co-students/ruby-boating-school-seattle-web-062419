class Instructor
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name
        @@all<<self
    end
    
    def self.all
        @@all
    end

    def pass_student(student,testname)
        passed_test= nil
        BoatingTest.all.each do |test|
           if test.testname==testname && test.student==student
              test.status = "passed"
              passed_test=test
           end   
        end
        if passed_test==nil
           passed_test=BoatingTest.new(student,testname,"passed",self)
        end
        return passed_test    
    end

    def fail_student(student,testname)
      failed_test=nil
      BoatingTest.all.each do |test|
        if test.student==student && test.testname==testname
            test.status="failed"
            failed_test = test
        end
      end
      if failed_test == nil
        failed_test= BoatingTest.new(student,testname,"failed",self)
      end
      failed_test
    end

end
