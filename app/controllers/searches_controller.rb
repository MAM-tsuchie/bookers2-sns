class SearchesController < ApplicationController
  def search
    search_word = params["search_word"]
    search_word = "%" + search_word + "%" if params[:type] == "part"
    if params["target"] == "user"
      @users = User.where("name like :word or introduction like :word",word: search_word)
    elsif params["target"] == "book"
      @books = Book.where("title like :word or body like :word",word: search_word)
    end
  end
end
