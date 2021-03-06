module Api
    module V1
        class BooksController < ApplicationController
            def index
                books = Book.order('created_at desc')
                render json: {status: 'SUCCESS', message: 'Loaded books', data: books}, status: :ok
            end
    
            def show
                book = Book.find(params[:id])
                reviews = Review.where(book_id: book.id)
                response_data = {book: book, reviews: reviews }
                render json: {status: 'SUCCESS', message: 'Loaded book', data: response_data}, status: :ok
            end
    
            def create
                book = Book.new(book_params)
        
                if book.save
                    render json: {status: 'SUCCESS', message: 'Saved book', data: book}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Book not saved', data: book.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                book = Book.find(params[:id])
                book.destroy
                render json: {status: 'SECCESS', message: 'Deleted book', data: book}, status: :ok
            end
    
            def update
                book = Book.find(params[:id])
                
                if book.update_attributes(book_params)
                    render json: {status: 'SUCCESS', message: 'Updated book', data: book}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Book not updated', data: book.errors}, status: :unprocessable_entity
                end
            end

            private
    
                def book_params
                    params.permit(:title, :author, :image, :url)
                end
        end
    end
end
