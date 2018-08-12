class HomeController < ApplicationController
  def free
    @freeposts = Freepost.all
  end

  def freepost #action that creates freepsot
    @freepost = Freepost.new(title: params[:title],
      username: params[:username],
      content: params[:content] )
    @freepost.save
    redirect_to "/freeshow/#{@freepost.id}"
  end

  def freenew #view for users to input data
  end

  def freeindex #list of titles of freeposts
    @freeposts = Freepost.all
  end

  def freeshow #view for specific freepost
    @freepost = Freepost.find(params[:freepost_id])
  end

  def freedestroy #action for deleting specific freepost
    @freepost = Freepost.find(params[:freepost_id])
    @freepost.destroy

    redirect_to "/freeindex"
  end

  def freeupdate #action that data is changed
    @freepost = Freepost.find(params[:freepost_id])
    @freepost.title = params[:title]
    @freepost.username = params[:username]
    @freepost.content = params[:content]
    @freepost.save
    redirect_to "/freeshow/#{@freepost.id}"

  end

  def freeedit #view which user inputs data for update
    @freepost = Freepost.find(params[:freepost_id])

  end

  def freecomment #action for creating new comment to freepost
    @freecomment = Freecomment.new(username: params[:username],
      content: params[:content],
      freepost_id: params[:freepost_id])
    @freecomment.save

    redirect_to "/home/free"
  end

  def freelike #action for creating new like
    fl = Freelike.new
    fl.user = current_user
    fl.freepost_id = param[:freepost_id]
    fl.save
    redirect_to "/home/free"
  end

  def freeunlike #action for deleting existing like
    fl = Freelike.find(params[:freepost_id])
    fl.delete
    redirect_to "/home/free"
  end

  def freedislike #action for creating new dislike
    fd = Freedislike.new
    fd.user = current_user
    fd.freepost_id = param[:freepost_id]
    fd.save
    redirect_to "/home/free"
  end

  def freeundislike #action for deleting existing dislike
    fd = Freedislike.find(params[:freepost_id])
    fd.delete
    redirect_to "/home/free"
  end

end
