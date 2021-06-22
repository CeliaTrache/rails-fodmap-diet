class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.boolean :to_avoid

      t.timestamps
    end
  end
end
