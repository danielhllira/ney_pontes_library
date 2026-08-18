class LibrariansController < ApplicationController
    def index
        @librarians = Librarian.all

    end

    def new
        @librarian = Librarian.new

    end

    def create
        @librarian = Librarian.new(librarian_params)

        if @librarian.save
            redirect_to librarians_path, notice: "Bibliotecário criado com sucesso!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def librarian_params
        params.require(:librarian).permit(:name, :email, :password, :password_confirmation)
    end

end
