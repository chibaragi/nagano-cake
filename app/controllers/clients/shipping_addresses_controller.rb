# frozen_string_literal: true

class Clients::ShippingAddressesController < ApplicationController
  def new
    @shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def create
    shipping_address = ShippingAddress.new(shipping_address_params)
    shipping_address.client_id = current_client.id
    shipping_address.save
    flash[:danger] =
      '必要情報を入力してください／ハイフンは使用できません'
    redirect_to new_shipping_address_path
  end

  def update
    shipping_address = ShippingAddress.find(params[:id])
    if shipping_address.update(shipping_address_params)
      flash[:success] = '編集を保存しました'
      redirect_to new_shipping_address_path
    else
      @shipping_address = ShippingAddress.find(params[:id])
      flash[:danger] =
        '必要情報を入力してください／ハイフンは使用できません'
      render "clients/shipping_addresses/edit"
    end
  end

  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    flash[:success] = '削除しました'
    redirect_to new_shipping_address_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postal_code, :street_address, :receive_name)
  end
end
