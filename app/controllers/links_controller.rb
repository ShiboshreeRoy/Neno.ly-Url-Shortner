# app/controllers/links_controller.rb
class LinksController < ApplicationController
    before_action :authenticate_user!, except: [:redirect]
    before_action :set_link, only: [:show, :edit, :update, :destroy]
  
    def index
      @links = current_user.links
    end
  
    def new
      @link = Link.new
    end
  
    def create
      @link = current_user.links.new(link_params)
      if @link.save
        redirect_to @link, notice: 'Link created successfully!'
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @link.update(link_params)
        redirect_to @link, notice: 'Link updated successfully!'
      else
        render :edit
      end
    end
  
    def destroy
      @link.destroy
      redirect_to links_path, notice: 'Link deleted successfully!'
    end
  
    def redirect
      @link = Link.find_by(short_code: params[:short_code])
      if @link
        @link.increment!(:clicks)
        redirect_to @link.original_url, allow_other_host: true
      else
        redirect_to root_path, alert: 'Link not found.'
      end
    end
  
    private
  
    def set_link
      @link = current_user.links.find(params[:id])
    end
  
    def link_params
      params.require(:link).permit(:original_url)
    end
  end