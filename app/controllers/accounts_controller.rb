class AccountsController < ApplicationController
	def index
		@supplier=Supplier.find(params[:supplier_id])
		@account=@supplier.account
	end
	def new
		@supplier=Supplier.find(params[:supplier_id])
		@account=@supplier.build_account
	end

	def create
		@supplier=Supplier.find(params[:supplier_id])
		@account=@supplier.build_account(account_params)
		@account.save
		redirect_to root_path
	end

	private
	def account_params
		params.require(:account).permit(:account_number,:supplier_id)
	end
end
