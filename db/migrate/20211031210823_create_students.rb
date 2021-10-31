class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.integer :marks1
      t.integer :marks2
      t.integer :marks3
      t.references :student_class, foreign_key: true

      t.timestamps
    end
  end
end
