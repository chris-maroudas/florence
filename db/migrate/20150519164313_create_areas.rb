class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :title
    end
  end
end
