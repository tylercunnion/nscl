class Admin::Cms::PagesController < ApplicationController
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]
  cache_sweeper :page_sweeper, :only => [:create, :update, :destroy]

  require_role "cms"

  # GET /pages
  # GET /pages.xml
  def index
    @category = PageCategory.find(params[:page_category_id])
    @pages = Page.all(:conditions => {:category_id => @category})

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @page = Page.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @page.category_id = params[:page_category_id]

    respond_to do |wants|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        wants.html { redirect_to(page_category_pages_path(params[:page_category_id])) }
        wants.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    logger.debug "Beginning update"
    respond_to do |wants|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        logger.debug "yeah:" + page_category_pages_path(params[:page_category_id])
        wants.html { redirect_to(page_category_pages_path(params[:page_category_id])) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page.destroy

    respond_to do |wants|
      wants.html { redirect_to(page_category_pages_path) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_page
      @page = Page.find(params[:id])
    end

end
