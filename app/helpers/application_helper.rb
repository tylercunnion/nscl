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
  
  
end
