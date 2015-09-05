class TopicsController < ApplicationController
  def index
    #@topics = Topic.paginate(page: params[:page], per_page: 10)
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    #authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic

    if @topic.save
      redirect_to @topic, notice: "Topic was saved sucessfully."
      

    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end 
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      redirect_to @topic
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
  end

end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy 
      flash[:notice] =  "\"#{@topic.name}\" was deleted successfully."
      redirect_to topics_path

    else flash[:error] = "Error deleting topic. Please try again."
      render :show
    
    end
  end
end

