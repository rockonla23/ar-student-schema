require_relative '../../db/config'

class StudentTeacher < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
# implement your Student model here
end
