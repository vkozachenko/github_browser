require 'net/http'
require 'json'

module GitHubService

  def search_projects(keywords)
    hash = send_request("search/repositories?q=#{keywords}")
  end

  def project_details(owner_name, repository_name)
    hash = send_request("repos/#{owner_name}/#{repository_name}")
  end

  def project_contributors(owner_name, repository_name)
    hash = send_request("repos/#{owner_name}/#{repository_name}/contributors")
  end

  def user_details(username)
    hash = send_request("users/#{username}")
  end

  def send_request(string)

    uri = URI.parse("https://api.github.com/#{string}")
    req = Net::HTTP::Get.new(uri.to_s)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(req)
    if response.code == "200"
      JSON.parse response.body
    else
      nil
    end

  end

end