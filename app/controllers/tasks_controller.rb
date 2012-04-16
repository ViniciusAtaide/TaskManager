class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new    
  end
  def create
    @tasks = Task.all
    @task = Task.new(params[:task])    
    
    if @task.save
      flash[:notice] = "Sucessfully created task"
      @tasks = Task.all      
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js
      end
    else    
      @task.errors.full_messages.each do |msg|
        flash[:notice] = msg   
      end         
    end
  end
  
  def done_delete
    @tasks = Task.all
    @task = Task.new

    if params[:commit] == 'Mark selected as done'      
      if Task.update_all(["done=?", "true"], :id => params[:tasks_id])      
        flash[:notice] = "All marked tasks are done"
        @tasks = Task.all
        respond_to do |format|
         format.html { redirect_to tasks_path }
         format.js
        end
      end
    elsif params[:commit] == "Delete selected"
      
      if Task.delete_all(:id => params[:tasks_id]) && Task.delete_all(["done=?", "true"])      
        flash[:notice] = "Sucessfully deleted all tasks"
        @tasks = Task.all
        respond_to do |format|
          format.html { redirect_to tasks_path }
          format.js
        end
      end
    end
  end

  def update
  end
  def edit
  end
  def show
  end
end