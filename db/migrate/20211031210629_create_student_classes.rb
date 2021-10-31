class CreateStudentClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_classes do |t|
      t.integer :class_number
      t.string :teacher1
      t.string :teacher2

      t.timestamps
    end
  end
end
