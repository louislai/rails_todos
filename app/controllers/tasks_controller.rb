class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks_incomplete = Task.where("completed = 'f'").order('created_at DESC')
    @tasks_complete = Task.where("completed = 't'").order('created_at DESC')
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
      redirect_to user_tasks_path(current_user), success: 'Task was successfully created.'
    else
      @tasks = @user.tasks.order('created_at DESC').all
      render action: :index
    end

  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json

  def update
    set_task
    respond_to do |format|
      if @task.update!(task_params) 
        format.json { respond_with_bip(@task) }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to user_tasks_url(current_user)
    flash[:info] = 'Task was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
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
