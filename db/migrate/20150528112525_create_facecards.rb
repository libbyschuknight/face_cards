class CreateFacecards < ActiveRecord::Migration
  def change
    create_table :facecards do |t|
      t.string :name
      t.string :face_url
      t.integer :stack_id
      t.timestamps null: false
    end
  end
end
