module Api
    module V1
        class ReviewsController < ApplicationController
            def index
                reviews = Review.order('created_at desc')
                render json: {status: 'SUCCESS', message: 'Loaded reviews', data: reviews}, status: :ok
            end
    
            def show
                review = Review.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded review', data: review}, status: :ok
            end
    
            def create
                review = Review.new(review_params)
        
                if review.save
                    render json: {status: 'SUCCESS', message: 'Saved review', data: review}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Review not saved', data: review.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                review = Review.find(params[:id])
                review.destroy
                render json: {status: 'SECCESS', message: 'Deleted review', data: review}, status: :ok
            end
    
            def update
                review = Review.find(params[:id])
                
                if review.update_attributes(review_params)
                    render json: {status: 'SUCCESS', message: 'Updated review', data: review}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Review not updated', data: review.errors}, status: :unprocessable_entity
                end
            end

            private
    
                def review_params
                    params.permit(:title, :content, :recommendation_level, :difficulty_level)
                end
        end
    end
end