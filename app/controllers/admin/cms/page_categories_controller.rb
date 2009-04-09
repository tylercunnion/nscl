class Admin::Cms::PageCategoriesController < ApplicationController
  before_filter :find_pageCategory, :only => [:show, :edit, :update, :destroy]

  require_role "cms"

  # GET /pageCategories
  # GET /pageCategories.xml
  def index
    @pageCategories = PageCategory.all(:order => "name ASC")

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @pageCategories }
    end
  end

  # GET /pageCategories/1
  # GET /pageCategories/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @pageCategory }
    end
  end

  # GET /pageCategories/new
  # GET /pageCategories/new.xml
  def new
    @pageCategory = PageCategory.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @pageCategory }
    end
  end

  # GET /pageCategories/1/edit
  def edit
  end

  # POST /pageCategories
  # POST /pageCategories.xml
  def create
    @pageCategory = PageCategory.new(params[:page_category])

    respond_to do |wants|
      if @pageCategory.save
        flash[:notice] = 'PageCategory was successfully created.'
        wants.html { redirect_to(@pageCategory) }
        wants.xml  { render :xml => @pageCategory, :status => :created, :location => @pageCategory }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @pageCategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pageCategories/1
  # PUT /pageCategories/1.xml
  def update
    respond_to do |wants|
      if @pageCategory.update_attributes(params[:page_category])
        flash[:notice] = 'PageCategory was successfully updated.'
        wants.html { redirect_to(@pageCategory) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @pageCategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pageCategories/1
  # DELETE /pageCategories/1.xml
  def destroy
    @pageCategory.destroy

    respond_to do |wants|
      wants.html { redirect_to(page_categories_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_pageCategory
      @pageCategory = PageCategory.find(params[:id])
    end

end
