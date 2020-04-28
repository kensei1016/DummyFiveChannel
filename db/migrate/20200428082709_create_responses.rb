class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.references :suread
      t.references :user
      t.text :comment

      t.timestamps
    end
  end
end
