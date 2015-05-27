class CreateFacecards < ActiveRecord::Migration
  def change
    create_table :facecards do |t|
      t.string :name
      t.string :face_url
      t.timestamps null: false
    end
  end
end
