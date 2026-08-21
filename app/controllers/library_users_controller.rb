class LibraryUsersController < ApplicationController
    before_action :set_library_user, only: %i[edit update destroy]

    def index
        @library_users = LibraryUser.all
    end

    def new
        @library_user = LibraryUser.new
    end

    def edit
    end

    def create
        @library_user = LibraryUser.new(library_user_params)

        if @library_user.save
            LibraryUserMailer.temporary_password(@library_user, @library_user.password).deliver_later
            redirect_to library_users_path, notice: "Usuário criado"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @library_user.update(library_user_params)
            redirect_to library_users_path, notice: "Usuário atualizado"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @library_user.destroy
        redirect_to library_users_path, notice: "Usuário removido", status: :see_other
    end

    private

    def set_library_user
        @library_user = LibraryUser.find(params[:id])
    end

    def library_user_params
        params.require(:library_user).permit(:full_name, :cpf, :phone, :email)
    end

end
