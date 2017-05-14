class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_orid

  def create
    @comment = @orid.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      @orid.watchers.each do |user|
        if user != current_user
          Notification.create(recipient: user , actor: current_user, action: "create", notifiable: @comment )
        end
      end
      flash[:notice] = "成功留言"
      redirect_to orid_path(@orid)
    else
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:message)
  end

  protected

  def find_orid
    @orid = Orid.find(params[:orid_id])
  end
end
