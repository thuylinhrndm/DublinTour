class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # find the tour for the id provided
    @tour = Tour.find(params[:tour_id])
   # Get all the posts associated with this tour
    @posts = @tour.posts 
  end

  def show
    @tour = Tour.find(params[:tour_id])
    # Find an post in tours 1 that has id=2
    @post = @tour.posts.find(params[:id])
  
  end
  
  # GET /tours/1/posts/new
  def new
    @tour = Tour.find(params[:tour_id])
    # Associate an post object with the tour
    @post = @tour.posts.build
   
  end
  
  # GET /tours/1/posts/2/edit
  def edit
    @tour = Tour.find(params[:tour_id])
    @post = @tour.posts.find(params[:id])
  end
  
  
  # POST /tours/1/posts
  def create
    @tour = Tour.find(params[:tour_id])
    @post = @tour.posts.build(post_params)
    if @post.save
    # Post saved, redirect to tour page
    redirect_to tour_post_url(@tour, @post)
    else
    render :action => "new"
    end
   
  end

  # PUT /blogs/1/posts/2
  # PUT /blogs/1/posts/2
  
  def update
  @tour = Tour.find(params[:tour_id])
  @post = Post.find(params[:id])
 
   if @post.update_attributes(post_params)
    # Post saved, redirect
    redirect_to tour_post_url(@tour, @post)
   else
    render :action =>"edit"
   end
  end
  
  

  # DELETE /tours/1/posts/2
  def destroy
    @tour = Tour.find(params[:tour_id])
    @post = Post.find(params[:id])
    @post.destroy
    
    respond_to do |format|
    format.html {redirect_to tour_posts_path(@tour) }
    format.xml { head :ok }
    end
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:post_message)
    end
end
