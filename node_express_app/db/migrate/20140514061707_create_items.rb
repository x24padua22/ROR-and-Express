class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
