xml.instruct! :xml, :version => "1.0"

xml.urlset do
  @actions.each do |action|
    xml.url do
      xml.loc url_for(action.merge({:only_path => false}))
    end
  end
end

