class PagesController < ApplicationController

  def home
    redirect_to weddings_path
  end

  def admin_photos
    if params[:search]
      @items = Photo.all.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @items = Photo.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def admin_pages
    if params[:search]
      @items = Subpage.all.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @items = Subpage.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def admin_blog
    if params[:search]
      @items = Blog.all.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @items = Blog.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end

  def blog
    @blogs = Blog.all
  end

  def about
    @photos = Photo.where(category: 'about')
  end

  def contact
    @photos = Photo.where(category: 'contact')
  end

  def album
    @subpages = Subpage.where(category: 'album')
  end

  def weddings
    @subpages = Subpage.where(category: 'weddings')
  end

  def lifestyle
    @subpages = Subpage.where(category: 'lifestyle')
  end
  
end