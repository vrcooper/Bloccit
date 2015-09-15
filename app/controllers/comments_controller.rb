class CommentsController < ApplicationController
  def create
    #@topic = Topic.find (params[:topic_id])
    #@post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    authorize @comment
    
    if @comment.save
     
      redirect_to [@topic, @post],  notice: "Comment was saved."

    else

      redirect_to [@topic, @post], notice: "There was an error saving the comment. Please try again."

      
    end
  end

  def destroy
    #@topic = Topic.find(params[:topic_id])
    #@post = @topic.posts.find(params[:post_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic # @post.send(:topic)
    @comment = @post.comments.find(params[:id])

    authorize @comment
    
    if @comment.destroy
      flash[:notice] = "Comment was removed."
     

    
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end

private

  def comment_params
    params.require(:comment).permit(:body)

  end