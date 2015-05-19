class CreatePackets < ActiveRecord::Migration
  def change
    create_table :packets do |t|
      t.string :type
      t.text :description
      t.decimal precision: 8, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
