module SectionsHelper

  def render_category?(section)
    if @_current_category.nil?
      @_current_category ||= section.category
      return true
    elsif @_current_category != section.category
      @_current_category = section.category
      return true
    else
      return false
    end
  end

end
