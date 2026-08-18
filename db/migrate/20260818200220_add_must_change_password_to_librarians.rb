class AddMustChangePasswordToLibrarians < ActiveRecord::Migration[8.1]
  def change
    add_column :librarians, :must_change_password, :boolean, default: false
  end
end
