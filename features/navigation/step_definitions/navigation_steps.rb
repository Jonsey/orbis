Then /^the main menu should contain the following links:$/ do |table|
  response.should have_tag("div#nav-main") do
    with_tag("ul") do
      table.hashes.each do |item|
        with_tag("li", :class => item[:class]) do
          with_tag("a", :href => url_for(item[:link]), :text => item[:name])
        end
      end
    end
  end
end

Then /^the sub menu should contain the following links:$/ do |table|
  response.should have_tag("div#nav-sub") do
    with_tag("ul") do
      table.hashes.each do |item|
        with_tag("li", :class => item[:class]) do
          with_tag("a", :href => url_for(item[:link]), :text => item[:name])
        end
      end
    end
  end
end
