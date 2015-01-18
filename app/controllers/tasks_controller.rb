class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    if params[:query]
      @tasks = @tasks.search(params[:query])
      set_complete_incomplete
      render 'tasks/search'
    else
      set_complete_incomplete
    end
  end


  # GET /tasks/new
  def new
    set_user
    @task = @user.tasks.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    set_user
    @task = @user.tasks.new(task_params)   
    if @task.save
      respond_to do |format|
        format.html
        format.js {}
      end
    else
      format.js   { render json: @task.errors, status: :unprocessable_entity }
      # set_complete_incomplete
      # render action: :index
    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json

  def update
    set_task
    respond_to do |format|
      if @task.update!(task_params)
        format.html
        format.json { respond_with_bip(@task) }
        format.js
      else
        format.js   { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.js { render layout: false}    
    end
    flash.now[:info] = 'Task was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complete_incomplete
      @tasks_incomplete = @tasks.where("completed = 'f'").order('created_at DESC')
      @tasks_complete = @tasks.where("completed = 't'").order('created_at DESC')
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_task
      @user = User.find(params[:user_id])
      @task = @user.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task, :deadline, :all_tags, :completed)
    end
end
