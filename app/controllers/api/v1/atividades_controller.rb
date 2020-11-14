module Api
  module V1
    class AtividadesController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_atividade, only: [:show, :update, :destroy]

      # GET /atividades
      def index
        @atividades = current_user.atividades.all

        render json: @atividades
      end

      # GET /atividades/1
      def show
        render json: @atividade
      end

      # POST /atividades
      def create
        @atividade = current_user.records.build(atividade_params)

        if @atividade.save
          render json: @atividade, status: :created, location: @atividade
        else
          render json: @atividade.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /atividades/1
      def update
        if @atividade.update(atividade_params)
          render json: @atividade
        else
          render json: @atividade.errors, status: :unprocessable_entity
        end
      end

      # DELETE /atividades/1
      def destroy
        @atividade.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_atividade
          @atividade = current_user.atividades.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def atividade_params
          params.require(:atividade).permit(:name, :description, :turma_id)
        end
    end
  end
end
