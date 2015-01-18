class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    redirect_to user_tasks_path(current_user)
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    set_task_for_show
    render 'tasks/index'
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { respond_with_bip(@tag) }
        format.js {}
      else
        format.html { render :new }
      end
    end
  end


  private
    def set_task_for_show
      tasks = current_user.tags.find(params[:id]).tasks
      @tasks_incomplete = tasks.where("completed = 'f'").order('created_at DESC')
      @tasks_complete = tasks.where("completed = 't'").order('created_at DESC')
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
