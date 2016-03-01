class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :question, index: true, foreign_key: true
      t.references :option, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
