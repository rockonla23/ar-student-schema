require 'rspec'
require 'date'
require_relative '../app/models/teacher'


describe Teacher, "check email" do

 before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless expect(ActiveRecord::Base.connection.table_exists?(:teachers)).to eq true
    Teacher.delete_all
  end

  before(:each) do
    @teacher = Teacher.new
    @teacher.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '(510) 555-1212 x4567'
    )
  end

  it "should accept valid info" do
    expect(@teacher).to be_valid
  end

  it "shouldn't accept invalid emails" do
    ["XYZ!bitnet", "@.", "a@b.c"].each do |address|
      @teacher.assign_attributes(:email => address)
      expect(@teacher).to_not be_valid
    end
  end

  it "should accept valid emails" do
    ["joe@example.com", "info@bbc.co.uk", "bugs@devbootcamp.com"].each do |address|
      @teacher.assign_attributes(:email => address)
      expect(@teacher).to be_valid
    end
  end


  it "shouldn't allow two teachers with the same email" do
    another_teacher = Teacher.create!(
      :first_name => @teacher.first_name,
      :last_name => @teacher.last_name,
      :email => @teacher.email,
      :phone => @teacher.phone
    )
    expect(@teacher).to_not be_valid
  end

end
