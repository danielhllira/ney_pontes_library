class LibraryUser < ApplicationRecord
    has_secure_password

    has_many :histories

    before_validation :set_password, on: :create

    validates :full_name, :cpf, :phone, :email, presence: true
    validates :cpf,uniqueness: true

    private

    def set_password
        self.password = generate_temporary_password
    end

    def generate_temporary_password
        chars = (('A'..'Z').to_a + ('2'..'9').to_a) - %w[O I L]
        Array.new(6) { chars[SecureRandom.random_number(chars.size)] }.join
    end

end
