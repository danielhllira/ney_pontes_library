class CreateHistory
    Result = Struct.new(:success?, :data, :error)

    def self.call(history_params)
        new(history_params).call
    end

    def initialize(history_params)
        @history_params = history_params
    end

    def call
        history = History.new(@history_params)

        History.transaction do
            raise ActiveRecord::Rollback unless history.save

            unless history.book.update(status: history.status)
                history.errors.add(:base, "Não foi possível atualizar o status do livro")
                raise ActiveRecord::Rollback
            end
        end

        if history.persisted?
            Result.new(true, history, nil)
        else
            Result.new(false, history, history.errors.full_messages.join(", "))
        end
    end
end
