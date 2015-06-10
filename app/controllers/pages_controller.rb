class PagesController < ApplicationController

  def home
    redirect_to weddings_path
  end

  def admin_photos
    if params[:search]
      @items = Photo.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @items = Photo.all.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def admin_pages
    if params[:search]
      @items = Subpage.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @items = Subpage.all.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def admin_blog
    if params[:search]
      @items = Photo.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
      @items = Blog.all.paginate(:page => params[:page], :per_page => 5)
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