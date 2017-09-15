class PagesController < ApplicationController

  include GitHubService

  def home
    @project      = project_details('trailblazer', 'trailblazer')
    @contributors = project_contributors('trailblazer', 'trailblazer')
    if @project.present?
      @like         = LikeProject.find_by_github_project_id(@project['id']) || LikeProject.new
      @page         = root_path
    end
  end

  def search
    keywords  = params[:keywords].split(/\W/).reject(&:blank?).join('+')
    @projects = search_projects(keywords)
    unless @projects.present?
      flash[:error] = "Sorry, something went wrong. Try again later."
      redirect_to root_path
    end
  end

  def project_info
    project_name  = params[:project]
    project_owner = params[:owner]
    @project      = project_details(project_owner, project_name)
    @contributors = project_contributors(project_owner, project_name)
    if @project.present?
      @like = LikeProject.find_by_github_project_id(@project['id']) || LikeProject.new
      @page = "/projects/#{project_owner}/#{project_name}"
    else
      flash[:error] = "Sorry, we can't find this project"
      redirect_to root_path
    end
  end

  def user_info
    user_name = params[:id]
    @user     = user_details(user_name)
    if @user.present?
      @like = LikeUser.find_by_github_user_id(@user['id']) || LikeUser.new
      @page = "/users/#{user_name}"
    else
      flash[:error] = "Sorry, we can't find this user"
      redirect_to root_path
    end

  end

end