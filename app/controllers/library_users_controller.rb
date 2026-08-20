class LibraryUsersController < ApplicationController
    def index
        @library_users = LibraryUser.all
    end

    def new
        @library_user = LibraryUser.new
    end

    def create
        @library_user = LibraryUser.new(library_user_params)

        if @library_user.save
            redirect_to library_users_path, notice: "Usuário criado"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def library_user_params
        params.require(:library_user).permit(:full_name, :cpf, :phone, :email)
    end

end
