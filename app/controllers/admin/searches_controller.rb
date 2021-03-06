class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  
  def search
    # 検索対象
    @model = params[:model]
    # 検索ワード
    @content = params[:content]
    #検索手法
    @method = params[:method]
    if @model == "user"
      @records = User.search_for(@content, @method)
    end
  end
end
