class CreateNormingSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :norming_sheets do |t|
      t.text :personality
      t.text :working_style
      t.text :life_beyond_kellogg
      t.text :development_goals
      t.text :hidden_superpower
      t.integer :class_id
      t.integer :sheet_list_id

      t.timestamps
    end
  end
end
