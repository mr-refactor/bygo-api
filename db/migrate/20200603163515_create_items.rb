class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.boolean :checked, default: false
      t.boolean :temp, default: false

      t.timestamps
    end
  end
end
