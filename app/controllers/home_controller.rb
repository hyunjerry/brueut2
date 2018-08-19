class HomeController < ApplicationController
  def free
    @freeposts = Freepost.all

    @current_user = current_user
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
    @current_user = current_user

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
    @fl = Freelike.new
    @fl.user_id = current_user.id
    @fl.freepost_id = params[:freepost_id]
    @fl.save
    redirect_to "/freeshow/#{@fl.freepost_id}"
  end

  def freeunlike #action for deleting existing like
    @fl = Freelike.where(:freepost_id => params[:freepost_id]).where(:user_id => current_user.id).take
    @fl.delete
    redirect_to "/freeshow/#{@fl.freepost_id}"
  end

  def freedislike #action for creating new dislike
    @fd = Freedislike.new
    @fd.user_id = current_user.id
    @fd.freepost_id = params[:freepost_id]
    @fd.save
    redirect_to "/freeshow/#{@fd.freepost_id}"
  end

  def freeundislike #action for deleting existing dislike
    @fd = Freedislike.where(:freepost_id => params[:freepost_id]).where(:user_id => current_user.id).take
    @fd.delete
    redirect_to "/freeshow/#{@fd.freepost_id}"
  end

end
