class Admin::GistsController < ApplicationController

  def index
    @gists = Gist.all
  end

  def destroy
    @client = Octokit::Client.new(:access_token => ENV['ACCESS_TOKEN'])

    @gist = Gist.find(params[:id])
    @client.delete_gist(@gist.url_id)

    @gist.destroy

    redirect_to admin_gists_path
  end
end
