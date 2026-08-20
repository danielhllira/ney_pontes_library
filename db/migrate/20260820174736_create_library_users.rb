class CreateLibraryUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :library_users do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
