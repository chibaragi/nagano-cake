# frozen_string_literal: true

class Admins::ClientsController < ApplicationController
  # 全体を通して記述している「.with_deleted」は論理削除したテーブルを含めるための記述。
  # paranoiaのgemの効果で.with_deletedを使用しない普通のやり方だと論理削除したテーブルを除外してくれる。
  # 例えば　Client.all と書くと普通はclientモデルの中身全てを参照するが、paranoiaのgemにより論理削除したテーブルを参照しなくなる。
  def show
    @client = Client.with_deleted.find(params[:id])
  end

  # kaminariのgemを適用するためpageの記述を入れている。
  def index
    @clients = Client.with_deleted.page(params[:page])
  end

  def edit
    @client = Client.with_deleted.find(params[:id])
  end

  def update
    @client = Client.with_deleted.find(params[:id])
    if @client.update(client_params)
      redirect_to admins_client_path(@client), notice: "個人情報を編集しました"
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :street_address, :deleted_at)
  end
end
