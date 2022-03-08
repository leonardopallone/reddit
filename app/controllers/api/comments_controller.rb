class Api::CommentsController < ApplicationController

  before_action :set_topic
  before_action :set_comment, only: [:show, :update, :destroy]
  def index 
    render json: @topic.comments 
  end

  def show 
    # @comment = Comment.find(params[:id])
    render json: @comment
  end 

  def create
    @commnent = @topic.comments.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: { errors: @comment.errors },  status: :unprocessable_entity
    end
  end

  def update
    # @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      render json: @commnet
    else
      render json: { errors: @comment.errors },  status: :unprocessable_entity
    end
  end

  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   render json: { message: 'Model_name deleted' }
  # end
  def destroy
    # @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { message: 'Comment delete'}
  end

  private 
    # make sure we are passing the right fields 
    # controller validations
    # permitting
    # { sub: { title: 'travel' } }

    # not permitted 
    # { person: { body: 'travel' } }

    # sql injection 
    # { sub: { title: 'SELECT * CCNUM FROM DB' } }

    def comment_params
      params.require(:comment).permit(:author, :body)
    end

    def set_comment
      @commment = @topic.comments.find(params[:id])
    end

  def set_topic # to set parent and child relation see line 3
    @topic = Topic.find(params[:topic_id])
  end

end


end
