class PasswordUpdatesController < ApplicationController
  skip_before_action :require_password_change, only: %i[edit update]

  def edit; end

  def update
    current_librarian.assign_attributes(password_update_params)
    current_librarian.must_change_password = false

    if current_librarian.save
      bypass_sign_in(current_librarian, scope: :librarian)
      redirect_to root_path, notice: "Senha atualizada com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_update_params
    params.require(:librarian).permit(:password, :password_confirmation)
  end
end
