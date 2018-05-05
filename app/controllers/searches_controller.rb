class SearchesController < ApplicationController
  def index
    q = params[:search]
    users = User.search(name_or_email_cont: q).result
    @items = users
    respond_to do |format|
      format.js
      format.html
    end
  end
end
