class HomeController < ApplicationController
    def index
        @turmas = Turma.all

        render json: @turmas
    end
end