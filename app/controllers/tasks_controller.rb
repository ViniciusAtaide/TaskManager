class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
      format.json { render json: @task}
    end
  end

  def create
    @tasks = Task.all
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_url
    else
      render :action => 'index'
    end
  end
  
  def done_delete
    if params[:commit] == 'Mark selected as done'
      Task.update_all(["done=?", "true"], :id => params[:tasks_id])
      redirect_to tasks_path
    elsif params[:commit] == "Delete selected"
      Task.delete_all(:id => params[:tasks_id])  
      redirect_to tasks_path
    end
  end

  def update
  end
  def edit
  end
  def show
  end
end
