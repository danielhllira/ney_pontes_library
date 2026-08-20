class History < ApplicationRecord
    belongs_to :book
    belongs_to :library_user

    enum :status, {
        available: "available",
        borrowed: "borrowed",
    }, prefix: :status

    validates :status, presence: true
    validate :check_user_password 

    attr_accessor :user_password
    
    private

    def check_user_password
        return if library_user.present? && library_user.authenticate(user_password)

        errors.add(:base, "Senha do usuário inválida")
    end
end
