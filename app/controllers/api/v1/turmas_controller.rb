module Api
  module V1
    class TurmasController < ApplicationController
      before_action :authorize_access_request!, except: [:show, :index]
      before_action :set_turma, only: [:show, :update, :destroy]

      # GET /turmas
      def index
        @turmas = Turma.all

        render json: @turmas
      end

      # GET /turmas/1
      def show
        render json: @turma
      end

      # POST /turmas
      def create
        @turma = Turma.new(turma_params)

        if @turma.save
          render json: @turma, status: :created, location: @turma
        else
          render json: @turma.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /turmas/1
      def update
        if @turma.update(turma_params)
          render json: @turma
        else
          render json: @turma.errors, status: :unprocessable_entity
        end
      end

      # DELETE /turmas/1
      def destroy
        @turma.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_turma
          @turma = Turma.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def turma_params
          params.require(:turma).permit(:name)
        end
    end
  end
end