class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite
    
    if favorite.save
      # Add code to generate a success flash and redirect to post
      # Remember the path shortcut: [post.topic, post]

      redirect_to [post.topic, post],  notice: "Favorite was saved."


    else
      # Add code to generate a failure flash and redirect to post

      redirect_to [@topic, @post], notice: "There was an error saving the favorite. Please try again."

    end
  end

    def destroy
      # Get the post from the params
      # Find the current user's favorite with the ID in the params

      post = Post.find(params[:post_id])
      favorite = current_user.favorites.find(params[:id])
      authorize favorite

      if favorite.destroy
        # Flash success and redirect to @post
        redirect_to [post.topic, post], notice: "Favorite was deleted."

      else
        # Flash error and redirect to @post
        redirect_to [post.topic, post], notice: "There was an error deleting the favorite. Please try again."

      end
    end

end
