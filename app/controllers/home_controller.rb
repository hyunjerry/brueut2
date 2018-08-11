class HomeController < ApplicationController
  def free
    @freeposts = Freepost.all
  end


  def freepost
    post = Freepost.new(title: params[:title],
      username: params[:username],
      content: params[:content] )
    post.save

    redirect_to "/home/free"
  end

  def freecomment
    comment = Freecomment.new(username: params[:username],
      content: params[:content],
      freepost_id: params[:freepost_id])
    comment.save

    redirect_to "/home/free"
  end
end
