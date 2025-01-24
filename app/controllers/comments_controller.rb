class CommentsController < ApplicationController

def create
  @prototype = Prototype.find(params[:prototype_id]) # コメント対象のプロトタイプを取得
  @comment = @prototype.comments.new(comment_params)
  if @comment.save
     redirect_to prototype_path(@comment.prototype)
  else
    @comments = @prototype.comments.includes(:user) # 既存コメントの取得
    render  "prototypes/show", status: :unprocessable_entity
  end
end

private
def comment_params
  params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
end

end
