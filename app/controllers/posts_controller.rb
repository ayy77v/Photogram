class PostsController < ApplicationController



	
	def index
		 @posts = Post.all
	end

	def new
       @post = current_user.posts.build
	end

	def create
      @post = current_user.posts.build(post_params)
	    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
	end

	def show
       @post = Post.find(params[:id])
   end


def edit
	  @post = current_user.posts.find(params[:id])
end

def update
  @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render :edit
    end
  end

def destroy
 @post = current_user.posts.find(params[:id])
  @post.destroy
  redirect_to posts_path
end

	private

     def post_params
        params.require(:post).permit(:image, :caption)
     end


  def set_post
    @post = Post.find(params[:id])
  end




end
 