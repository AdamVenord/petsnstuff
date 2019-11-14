class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :body
      t.belongs_to :sub, null: false, foreign_key: true

      t.timestamps
    end
  end
end
