class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :style
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
