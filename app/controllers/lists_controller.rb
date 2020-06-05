class ListsController < ApplicationController
    before_action :find_list, only: [:show, :item_index, :add_item, :update, :destroy]
    
    def index
        lists = List.all
        
        render json: lists, except: [:created_at, :updated_at]
    end

    def item_index
        items = @list.items
        render json: items, except: [:created_at, :updated_at]
    end

    def create
        list = List.new(list_params)
        
        if list.save
            render json: list, except: [:created_at, :updated_at]
        else
            render json: {"error": "could not make a new list"}
        end
    end

    def add_item
        item = Item.find_or_create_by(name: item_params[:name])
        
        if item
            @list.items << item
            render json: item, except: [:created_at, :updated_at]
        else
            render json: {"error": "could not make a new item"}
        end
    end

    def show
        render json: @list, except: [:created_at, :updated_at]
    end

    def update
        if @list.update(list_params)
            render json: @list, except: [:created_at, :updated_at]
        else
            render json: {"error": "could not udpate your list"}
        end
    end

    def destroy
        if @list.destroy
            render json: {"message": "this list has been deleted"}
        else
            render json: {"error": "could not delete your list"}
        end
    end

        private

        def find_list
            @list = List.find(params[:id])
        end

        def list_params
            params.require(:list).permit(:name, :note, :user_id)
        end

        def item_params
            params.require(:item).permit(:name, :category)
        end
end
