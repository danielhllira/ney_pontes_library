class HistoriesController < ApplicationController
    def index
        @histories = History.all
    end

    def new
        attrs = new_history_attributes
        @history = History.new(attrs)
        @locked = attrs.key?(:book_id) && attrs.key?(:status)
    end

    def create
        result = CreateHistory.call(history_params)

        if result.success?
            redirect_to histories_path, notice: "Empréstimo realizado"
        else
            @history = result.data
            @locked = params[:locked] == "true"
            render :new, status: :unprocessable_entity
        end
    end

    private

    def new_history_attributes
        attrs = {}
        attrs[:book_id] = params[:book_id] if params[:book_id].present? && Book.exists?(id: params[:book_id])
        attrs[:status] = params[:status] if History.statuses.key?(params[:status])
        attrs
    end

    def history_params
        params.require(:history).permit(:status, :library_user_id, :book_id, :user_password)
    end

end
