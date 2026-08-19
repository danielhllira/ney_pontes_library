class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_enum :status, %w[available borrowed]

    create_table :books do |t|
      t.string :author, null: false
      t.string :title, null: false
      t.references :category, null: false, foreign_key: true
      t.enum :status, enum_type: :status, default: "available"
      t.text :observation

      t.timestamps
    end
  end
end
