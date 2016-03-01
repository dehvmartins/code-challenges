class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :token, array: true, default: []
      t.integer :status, default: 0, null: false
      t.timestamps null: false
    end
  end
end
