class WelcomeController < ApplicationController
    def index
        render json: {"message": "What are you doing here?"}
    end
end
