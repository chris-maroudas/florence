class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :title
      t.string :address
      t.text :description
      t.timestamps
    end
  end
end
