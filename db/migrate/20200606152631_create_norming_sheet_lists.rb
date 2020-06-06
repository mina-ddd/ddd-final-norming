class CreateNormingSheetLists < ActiveRecord::Migration[6.0]
  def change
    create_table :norming_sheet_lists do |t|
      t.integer :student_id

      t.timestamps
    end
  end
end
