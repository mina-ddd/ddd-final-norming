class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :year
      t.string :quarter
      t.string :course_name
      t.string :group_number

      t.timestamps
    end
  end
end
