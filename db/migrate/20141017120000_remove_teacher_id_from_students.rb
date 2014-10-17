require_relative '../config'

class RemoveTeacherIdFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :teacher_id, :integer
  end
end
