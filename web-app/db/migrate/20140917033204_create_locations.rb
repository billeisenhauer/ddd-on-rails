class CreateLocations < ActiveRecord::Migration

  def change
    create_table :locations, id: false do |t|
      t.string :un_locode, null: false
      t.string :name, null: false
    end
    add_index :locations, :un_locode, unique: true
  end

end
