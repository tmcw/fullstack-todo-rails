class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  def active
    @tasks = Task.active
    render :index
  end

  def completed
    @tasks = Task.completed
    render :index
  end

  # GET /tasks/1/edit
  def edit
  end

  def toggle_all
    Task.all.update(done: Task.where(done: false).any?)
    redirect_back fallback_location: root_path
  end

  def clear_completed
    Task.destroy_by(done: true)
    redirect_back fallback_location: root_path
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :done)
    end
end
