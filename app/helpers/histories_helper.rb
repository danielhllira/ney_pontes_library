module HistoriesHelper 
    def list_library_users
       LibraryUser.all.map do |library_user|
            [library_user.full_name, library_user.id]
        end 
    end

    def list_books
        Book.all.map do |book|
            [book.title, book.id]
        end 
    end
end
