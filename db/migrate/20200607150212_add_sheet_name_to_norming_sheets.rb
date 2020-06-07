class AddSheetNameToNormingSheets < ActiveRecord::Migration[6.0]
  def change
    add_column :norming_sheets, :title, :string
  end
end
