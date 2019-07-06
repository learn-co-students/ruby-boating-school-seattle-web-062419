class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(name)
        Student.all.find { |student| student.first_name == name }
    end

    def grade_percentage
        tot_pass = 0.0
        tot_fail = 0.0

        BoatingTest.all.each do |test|
            if test.student == self && test.test_status == "passed"
                tot_pass += 1
            else
                tot_fail += 1
            end
        end

        (tot_pass / tot_fail).round(2)
    end
end