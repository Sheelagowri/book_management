class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null:false
      t.string :content
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
