class CreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table :administrators do |t|
      t.string :name,    :default => "", :null => false
      t.string :surname, :default => "", :null => false
    end
  end

  def self.down
    drop_table(:administrators)
  end
end
