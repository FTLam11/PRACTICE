class School
	def initialize
		@school = Hash.new { | school,grade | school[grade] = [] }
	end

	def grade(grade_level)
		@school[grade_level]
	end

	def add(student, grade_level)
		@school[grade_level] = grade(grade_level).push(student).sort!
	end

	def students_by_grade
		@school
	end
end

module BookKeeping
	VERSION = 2
end