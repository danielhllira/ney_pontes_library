class CreateHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :histories do |t|
      t.references :library_user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.enum :status, enum_type: :status

      t.timestamps
    end
  end
end
