class Business::OfficersController < BusinessController
  
  caches_page :view
  
  def index
    if params[:link]
      view
      render :action => 'view' and return
    end
    officer = Officer.find(:first)
    redirect_to :action => 'index', :link => officer.link
  end
  
  def view
    @officer = Officer.find_by_link(params[:link], :include => 'member')
    @page_title = "NSCL " + @officer.name
    #Default behavior is to use the school address if one is given, otherwise, prefer home address.
    #This could be modified into a flag on the officer object to see which one to use.
    #If neither is given, blank out the two address line variables.
    
    if @officer.member.school_address and @officer.member.school_address != ""
      @line_one = @officer.member.school_address
        #Check whether or not there is an apartment number
        if @officer.member.school_apt and @officer.member.school_apt != ""
          @line_one += " " + @officer.member.school_apt
        end
      #End line one
      #Begin line two
      @line_two = "#{@officer.member.school_city}, #{@officer.member.school_state.abbreviation} #{@officer.member.school_zip}"
    else
      #Check whether there is a home address
      if @officer.member.home_address and  @officer.member.home_address != ""
        @line_one = @officer.member.home_address
        if @officer.member.home_apt and @officer.member.home_apt != ""
          @line_one += " #{@officer.member.school_apt}"
        end
      @line_two = "#{@officer.member.home_city}, #{@officer.member.home_state.abbreviation} #{@officer.member.home_zip}"
      else
        @line_one = ""
        @line_two = ""
      end
   end   
  end
  
  enable_sitemap :only => :index, :dynamic => :index, :param => :link

end
