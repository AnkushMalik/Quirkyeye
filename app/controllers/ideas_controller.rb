class IdeasController < ApplicationController
  before_action :find_idea, only: [:show,:edit,:update,:destroy]
    def index
      @idea=Idea.all.order("created_at DESC")
    end
    def new
      @idea=Idea.new
    end
    def create
      @idea=Idea.new(find_params)

      if(@idea.save)
        redirect_to @idea,notice: "Successfully Broadcasted new Idea"
      else
        render 'new'
      end
    end
    def show

    end
    def edit

    end
    def update
      if @idea.update(find_params)
        redirect_to @idea, notice: "Idea was Successfully updated!"
      else
        render 'edit'
      end
    end
    def destroy
      @idea.destroy
      redirect_to root_path
    end

    private

    def find_params
      params.require(:idea).permit(:title,:description)
    end

    def find_idea
      @idea=Idea.find(params[:id])
    end
end
