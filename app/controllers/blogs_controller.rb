class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to blog_path(params[:id])
  end

  def show
    
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
