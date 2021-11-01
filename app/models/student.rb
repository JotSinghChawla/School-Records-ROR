class Student < ApplicationRecord
  belongs_to :student_class

  validates :name, :rollnumber, :age, :marks1, :marks2, :marks3, :student_class_id, presence: true
  validates :rollnumber, uniqueness: { message: ": This rollnumber already exists" }
  # validates :rollnumber , length: { minimum: 1, maximum: 10000, message: ": Rollnumber should be smaller than 10000" }
  validates :rollnumber, length: { in: 1..10000 }               # Not working
  validates :marks1, :marks2, :marks3, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  before_save :update_before_save
  after_save :update_after_save

  def update_before_save
    logger.info "====================Student #{self.name} with Rollnumber:#{self.rollnumber} is going to be created===================="
  end

  def update_after_save
    logger.info "====================Student #{self.name} is created===================="
  end

end
