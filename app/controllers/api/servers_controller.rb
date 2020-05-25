# frozen_string_literal: true

module Api
  class ServersController < ApplicationController
    before_action :set_server, only: :destroy
    def index
      servers = Server.includes(:bandwidths).all
      render json: ServerSerializer.new(servers).serialized_json
    end

    def destroy
      @server.destroy
      render json: { success: true }
    end

    private

    def set_server
      @server = Server.find(server_params[:id])
    end

    def server_params
      params.permit(:id)
    end
  end
end
