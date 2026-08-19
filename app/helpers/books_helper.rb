require "action_view/helpers"

module BooksHelper
    STATUS = { "available" => "Disponível", "borrowed" => "Emprestado"}.freeze 

    def list_statuses
        [
            ["Disponível", "available"],
            ["Emprestado", "borrowed"]
        ]
    end

    def list_categories
       Category.all.map do |category|
            [category.name, category.id]
        end 
    end

    def status_decorate(status)
        STATUS[status]
    end

end
