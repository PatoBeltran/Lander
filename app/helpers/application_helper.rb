module ApplicationHelper
  def no_spaces_for(string)
    string.gsub(" ", "")
  end
end
