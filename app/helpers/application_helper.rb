# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Helper for putting right angle quotes next to current page in side nav.
  # Shortcut instead of putting a block in every single link.
  def link_to_for_sidebar(name, options = {}, html_options = {}, &block)
    if current_page?(options)
      if block_given?
        block.arity <= 1 ? yield(name) : yield(name, options, html_options)
      else
        "<span class=\"current-page-link\">&raquo; #{name}</span>"
      end
    else
      link_to(name, options, html_options)
    end
  end
  
  
  # Adapted from the Rubiadh Google Analytics plugin, subject to MIT License 
  
  def link_to_tracked(name, track_path = "/", options = {}, html_options = {})
    link_class = html_options.include?('class') ? html_options['class'] + " " + "ga-track" : "ga-track"
    html_options.merge!({:rel => track_path, :class => link_class})
    link_to name, options, html_options
  end
  
  # Creates a link tag of the given +name+ using a URL created by the set of +options+
  # if +condition+ is true, with outbound link tracking under +track_path+ in Google Analytics.   
  # The +html_options+ will accept a hash of attributes for the link tag.
  def link_to_tracked_if(condition, name, track_path = "/", options = {}, html_options = {}, &block)
    link_class = html_options.include?('class') ? html_options['class'] + " " + "ga-track" : "ga-track"
    html_options.merge!({:rel => track_path, :class => link_class})
    link_to_unless !condition, name, options, html_options, &block
  end
  
  # Creates a link tag of the given +name+ using a URL created by the set of +options+
  # unless +condition+ is true, with outbound link tracking under +track_path+ in Google Analytics. 
  # The +html_options+ will accept a hash of attributes for the link tag.
  def link_to_tracked_unless(condition, name, track_path = "/", options = {}, html_options = {}, &block)
    link_class = html_options.include?('class') ? html_options['class'] + " " + "ga-track" : "ga-track"
    html_options.merge!({:rel => track_path, :class => link_class})
    link_to_unless condition, name, options, html_options, &block
  end
  
  # Creates a link tag of the given +name+ using a URL created by the set of +options+
  # unless the current request URI is the same as the link's, with outbound link tracking 
  # under +track_path+ in Google Analytics. If the request URI is the same as the link 
  # URI, only the name is returned, or the block is yielded, if one exists.
  # The +html_options+ will accept a hash of attributes for the link tag.
  def link_to_tracked_unless_current(name, track_path = "/", options = {}, html_options = {}, &block)
    link_class = html_options.include?('class') ? html_options['class'] + " " + "ga-track" : "ga-track"
    html_options.merge!({:rel => track_path, :class => link_class})
    link_to_unless current_page?(options), name, options, html_options, &block
  end
  
  
end
