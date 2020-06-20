class Clients::ClientsController < ApplicationController
  def show
  	@client = current_client
  end

  def withdrawal
  end

  def edit
  	@client = Client.find(params[:id])
  end

  def update
  	@client = Client.find(params[:id])
  	if @client.update(client_params)
  		redirect_to client_path(current_user.id), notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end

  def logical_delete
  end

  private
  	def client_params
  		params.require(:clients).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :postal_code, :street_address)
  	end
end
