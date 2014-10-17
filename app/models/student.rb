require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here

  has_many :student_teachers
  has_many :teachers, through: :student_teachers

  validates :email, uniqueness: true
  validate :email_validate
  validates :age, numericality: { greater_than_or_equal_to: 5 }
  validate :phone_validate

  def email_validate
    if !(email.include? '@') || !(email.match(/^[^\-]*@/).to_s.length > 1) || !(email.match(/@[^\-]*\./).to_s.length) || !(email.match(/\.[^\-]*$/).to_s.length > 2)
      errors.add(:email, "INVALID EMAIL!!!!")
    end
  end

def phone_validate
  unless phone.gsub(/\D/, '').length >= 10
    errors.add(:phone, "INVALID PHONE!!!!")
  end
end


  def name
    self.first_name + ' ' +self.last_name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end