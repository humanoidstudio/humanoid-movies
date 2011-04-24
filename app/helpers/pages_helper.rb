module PagesHelper
  
  # Return title on a per-page basis
  def title
    base_title = "Cody Movies"
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
end
