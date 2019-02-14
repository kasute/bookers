class BlogsController < ApplicationController
  def show
     @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def new
     @blog =Blog.new
     @blogs =Blog.all
  end
  
  def create
      blog = Blog.new(blog_params)
     if  blog.save
       flash[:notice] = "Book was successfully updated."
      redirect_to blog_path(blog)
    else
      render aticion: :new
     end
  end

  def edit
      @blog = Blog.find(params[:id])
  end
  
  def update
      blog = Blog.find(params[:id])
      blog.update(blog_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to blog_path
  end
  
  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to new_blog_path
  end
  
  private
  def blog_params
      params.require(:blog).permit(:title, :body)
  end
end
