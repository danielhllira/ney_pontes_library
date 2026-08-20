class HistoriesController < ApplicationController
    def index
        @histories = History.all
    end

    def new
        @history = History.new
    end

    def create
        @history = History.new(history_params)

        if @history.save
            redirect_to histories_path, notice: "Empréstimo realizado"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def history_params
        params.require(:history).permit(:status, :library_user_id, :book_id, :user_password)
    end

end
