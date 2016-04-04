class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :content, null: false

      t.timestamps null: false
    end
  end
end
