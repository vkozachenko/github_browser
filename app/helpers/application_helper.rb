module ApplicationHelper

  def uri_for(string)
    unless string =~ /\Ahttp/
      return 'http://' + string
    end
    string
  end

  def is_homepage?
    params[:action] == 'home'
  end

  def is_project_page?
    params[:action] == 'project_info'
  end

  def is_user_page?
    params[:action] == 'user_info'
  end

  def is_search_page?
    params[:action] == 'search'
  end

  def like?(id, subject)
    (LikeUser.like_user?(id) && subject == :user) || (LikeProject.like_project?(id) && subject == :project)
  end

end
