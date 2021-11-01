class AddRollnumber < ActiveRecord::Migration[5.2]
  def change
    
    add_column :students, :rollnumber, :integer

    # Query Interface to fill roll number column
    # Student.find_by_sql("UPDATE students SET rollnumber = abs(random() % 10000)")

  end
end
