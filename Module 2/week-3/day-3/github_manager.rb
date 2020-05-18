# frozen_string_literal: true

require 'json'
require 'http'

# Manages github repos
class GithubRepoManager
  attr_reader :api_url, :email, :username, :base_req

  def initialize(email, password)
    @api_url = 'https://api.github.com'
    @email = email
    @password = password
    @base_req = HTTP.basic_auth(user: email, pass: password)
                    .headers(accept: 'application/vnd.github.v3+json')
    @username = fetch_username
  end

  def fetch_username
    req = base_req.get("#{api_url}/search/users?q=#{email}")
    parse_res(req, 'login', 200)['items'][0]['login']
  end

  def parse_res(res, context, success_code)
    parsed_res = JSON.parse(res) if res.to_s.match?(/\w/)
    case res.code
    when success_code
      puts "Success: #{context}"
    else
      puts "Error: #{parsed_res['message']}"
    end
    parsed_res
  end

  def create_repo(repo)
    req = base_req.post("#{api_url}/user/repos",
                        json: {
                          'name': repo,
                          'private': true
                        })
    parse_res(req, 'create repo', 201)
  end

  def delete_repo(repo)
    req = base_req.delete("#{api_url}/repos/#{username}/#{repo}")
    parse_res(req, 'delete repo', 204)
  end

  def update_repo_name(repo, name)
    req = base_req.patch("#{api_url}/repos/#{username}/#{repo}",
                         json: { name: name })
    parse_res(req, 'update repo name', 200)
  end
end
