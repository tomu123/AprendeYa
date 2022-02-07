class CreateUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :units do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
