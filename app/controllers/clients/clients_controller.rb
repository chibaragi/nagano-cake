# frozen_string_literal: true

class Clients::ClientsController < ApplicationController

  def show
    @client = current_client
  end

  def withdrawal
    @client = current_client
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to client_path(current_client.id), notice: "個人情報を編集しました"
    else
      render :edit
    end
  end

  def destroy #リソースを使用してルーティングを記述したため、logical_delete　から変更
    client = Client.find(params[:id])
    client.destroy
    redirect_to root_path, notice: "アカウントを削除しました"
  end

  private
    def client_params
      params.require(:client).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :street_address)
    end
end

