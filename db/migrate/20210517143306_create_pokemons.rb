class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :height
      t.integer :weight
      t.string :special_attack
      t.references :user, null: false, foreign_key: true
      t.integer :price_per_day
      t.integer :health_point

      t.timestamps
    end
  end
end
