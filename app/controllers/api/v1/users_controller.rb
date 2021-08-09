module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.order('created_at desc')
                render json: {status: 'SUCCESS', message: 'Loaded users', data: users}, status: :ok
            end
    
            def show
                user = User.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded user', data: user}, status: :ok
            end
    
            private
    
                def user_params
                    params.permit(:name, :email, :image)
                end
        end
    end
end
