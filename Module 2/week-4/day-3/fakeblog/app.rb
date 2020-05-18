require "sinatra"

if development?
  require "sinatra/reloader"
  require "rack/livereload"
  use Rack::LiveReload
end

extraposts = []

get "/" do
  erb :index, :layout => nil
end

get "/blog" do
  erb :blog, :locals => { extras: extraposts }
end

get "/blog/new" do
  erb :blog_new
end

get "/blog/:id" do
  redirect to "blog", 404 if extraposts.empty?
  erb :post_detail, locals: { post: extraposts[params[:id].to_i] }
end

post "/blog/new" do
  extraposts << { "id" => extraposts.size + 1 }.merge(request.POST)
  redirect to "/blog"
end
