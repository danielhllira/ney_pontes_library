class LibraryUserMailer < ApplicationMailer
    def temporary_password(library_user, password)
        @library_user = library_user
        @password = password

        mail to: @library_user.email, subject: "Sua senha de acesso à Biblioteca Ney Pontes"
    end
end
