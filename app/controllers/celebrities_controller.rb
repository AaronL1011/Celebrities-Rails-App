class CelebritiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data
    
    #Show all celebrities
    def index
        @celebrities = session[:celebrities]
    end
    
    #Show a single celebrity
    def show
        for celebrity in session[:celebrities]
            if celebrity["name"] == params[:name]
                @celebChoice = celebrity
            end
        end
    end
    
    #Create a new celebrity
    def create
        name = params[:name]
        notability = params[:notability]
        new_celeb = {name: name, notability: notability}
        session[:celebrities].push(new_celeb)
        render json: session[:celebrities]
    end
    
    #Update a celebrity
    def update
        new_name = params[:new_name]
        notability = params[:notability]

        for celeb in session[:celebrities]
            if celeb["name"] == params[:name]
                if new_name
                    celeb[:name] = new_name
                end
                if notability
                    book[:notability] = notability
                end
            end
        end
        render json: celeb
    end
    
    #Remove a celebrity
    def destroy
        session[:book_data] = session[:celebrities].select {|celeb| celeb["name"] != params[:name]} 
        render json: session[:celebrities]
    end

    private
    def setup_data
        session[:celebrities] = [
            { name: "Lindsay Lohan", notability: "Parent Trap" },
            { name: "Adam Sandler", notability: "Big Daddy" },
            { name: "Rob Schnider", notability: "Adam Sandler" }
        ] unless session[:celebrities]

    end
end