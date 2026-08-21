class BooksController < ApplicationController

    before_action :set_book, only: %i[edit update destroy]

    def index
        @books = Book.all

    end

    def new
        @book = Book.new

    end

    def edit
    end

    def create
        @book = Book.new(books_params)

        if @book.save
            redirect_to books_path, notice: "Livro adicionado"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @book.update(books_params)
            redirect_to books_path, notice: "Livro atualizado"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
        redirect_to books_path, notice: "Livro removido", status: :see_other
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def books_params
        params.require(:book).permit(:author, :title, :category_id, :status, :observation)
    end

end
