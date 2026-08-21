class LibrariansController < ApplicationController
    before_action :set_librarian, only: %i[edit update destroy]

    def index
        @librarians = Librarian.all
    end

    def new
        @librarian = Librarian.new
    end

    def edit
    end

    def create
        @librarian = Librarian.new(librarian_params)
        @librarian.must_change_password = true

        if @librarian.save
            redirect_to librarians_path, notice: "Bibliotecário criado com sucesso!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        params_to_update = librarian_params
        params_to_update = params_to_update.except(:password, :password_confirmation) if params_to_update[:password].blank?

        if @librarian.update(params_to_update)
            redirect_to librarians_path, notice: "Bibliotecário atualizado com sucesso!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @librarian.destroy
        redirect_to librarians_path, notice: "Bibliotecário removido com sucesso!", status: :see_other
    end

    private

    def set_librarian
        @librarian = Librarian.find(params[:id])
    end

    def librarian_params
        params.require(:librarian).permit(:name, :email, :password, :password_confirmation)
    end

end
