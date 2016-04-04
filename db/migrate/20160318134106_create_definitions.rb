class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :content, null: false
      t.references :word, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
