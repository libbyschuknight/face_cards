class AddGuessedToFacecards < ActiveRecord::Migration
  def change
    add_column :facecards, :guessed, :boolean, :default => false
  end
end
