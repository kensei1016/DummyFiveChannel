class CreateSureads < ActiveRecord::Migration[5.2]
  def change
    create_table :sureads do |t|
      t.references :user
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
