class SongsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :index]
  def new
    @user=current_user
  end
  def create
    @user=current_user
    if !params[:song].nil?
      @song=Song.new(user:current_user,file: song_params[:file])
      @song.name=@song.file.filename
      if @song.save
        flash[:notice]="ADDED"
        redirect_to :root
      else
        flash[:notice]="WRONG FORMAT"
        render 'new'
      end
    else
      flash[:notice]=params[:song]
      render 'new'
    end
  end
  def index
    @songs=current_user.songs
    @songs_json = Song.all.map(&:to_hash).to_json
    
  end

  private
  def song_params
    params.require(:song).permit(:file)
  end
end
