class CreateCategoriesSureads < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_sureads, id: false do |t|
      t.references :category,   foreign_key: true, null: false
      t.references :suread,     foreign_key: true, null: false
    end
  end
end
