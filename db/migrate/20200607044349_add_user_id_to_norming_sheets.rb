class AddUserIdToNormingSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :norming_sheets, :student_id, :integer
  end
end
