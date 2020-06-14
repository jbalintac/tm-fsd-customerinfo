module Api
    class CustomerController < ApplicationController
        def index
            @customers = Customer.order('created_at DESC');
        end

        def show
            @customer = Customer.find(params[:id])
        end

        def create
            @customer = Customer.new(customer_params)

            unless @customer.save
                render json: {status: 'ERROR', message:'Customer not saved', data:@customer.errors},status: :unprocessable_entity
            end
        end

        def destroy
            customer = Customer.find(params[:id])
            customer.destroy
            render json: customer, status: :ok
        end

        def update
            @customer = Customer.find(params[:id])
            unless @customer.update_attributes(customer_params)
                render json: {status: 'ERROR', message:'Customer not updated', data: @customer.errors}, status: :unprocessable_entity
            end
        end

        private

        def customer_params
            params.permit(:contact, :name, :description, :status)
        end
    end
end