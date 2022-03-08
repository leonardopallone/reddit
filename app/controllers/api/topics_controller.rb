class Api::TopicsController < ApplicationController
  before_action :set_sub #define the parent
  before_action :set_topic, only: [:show, :update, :destroy] # clean up the code

  def index 
    # render json: Topic.all 
    render json: @sub.topics 
  end

  def show 
    # @topic = Topic.find(params[:id])
    render json: @topic
  end 

  def create
    # @topic = Topic.new(topic_params)
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      render json: @topic
    else
      render json: { errors: @topic.errors },  status: :unprocessable_entity
    end
  end

  def update
    # @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      render json: @topic
    else
      render json: { errors: @topic.errors },  status: :unprocessable_entity
    end
  end

  # def destroy
  #   @model_name = Model_name.find(params[:id])
  #   @model_name.destroy
  #   render json: { message: 'Model_name deleted' }
  # end
  def destroy
    # @topic = Topic.find(params[:id])
    @topic.destroy
    render json: { message: 'Topic delete'}
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

    def topic_params
      params.require(:topic).permit(:title, :body)
    end
# FOR BEFORE ACTION LINE 83
    def set_topic
      @topic = @sub.topics.find(params[:id])
    end
    def set_sub 
      @sub = Sub.find (params[:sub_id])
    end
  
end
















end
