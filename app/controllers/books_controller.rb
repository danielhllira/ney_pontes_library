class BooksController < ApplicationController

    def index
        @books = Book.all

    end

    def new
        @book = Book.new 

    end

    def create
        @book = Book.new(books_params)

        if @book.save
            redirect_to books_path, notice: "Livro adicionado"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def books_params
        params.require(:book).permit(:author, :title, :category_id, :status, :observation)
    end

end
