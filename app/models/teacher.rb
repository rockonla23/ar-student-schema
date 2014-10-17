require_relative '../../db/config'

class Teacher < ActiveRecord::Base
  has_many :student_teachers
  has_many :students, through: :student_teachers


  validates :email, uniqueness: true
  validate :email_validate

  def email_validate
    if !(email.include? '@') || !(email.match(/^[^\-]*@/).to_s.length > 1) || !(email.match(/@[^\-]*\./).to_s.length) || !(email.match(/\.[^\-]*$/).to_s.length > 2)
      errors.add(:email, "INVALID EMAIL!!!!")
    end
  end

end