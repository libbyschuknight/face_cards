class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :name
      t.integer :user_id
      t.belongs_to :user, index: true
      t.belongs_to :facecard, index: true
      t.timestamps null: false
    end
  end
end
