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

  def freelike
    fl = Freelike.new
    fl.user = current_user
    fl.freepost_id = param[:freepost_id]
    fl.save
    redirect_to "/home/free"
  end

  def freeunlike
    fl = Freelike.find(params[:freepost_id])
    fl.delete
    redirect_to "/home/free"
  end

  def freedislike
    fd = Freedislike.new
    fd.user = current_user
    fd.freepost_id = param[:freepost_id]
    fd.save
    redirect_to "/home/free"
  end

  def freeundislike
    fd = Freedislike.find(params[:freepost_id])
    fd.delete
    redirect_to "/home/free"
  end

end
