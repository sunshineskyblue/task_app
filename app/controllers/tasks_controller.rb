class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(day_start: :ASC)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params.require(:task).permit(:title, :day_start, :day_end, :day_all, :memo))
    
    if @task.save
      flash[:notice] = "スケジュールを追加しました"
      redirect_to :tasks
    else
      flash[:error_notice] = "スケジュールを追加できませんでした"
      render 'new'
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])

    if @task.update(params.require(:task).permit(:title, :day_start, :day_end, :day_all, :memo))
       flash[:notice] = "スケジュールを更新しました"
       redirect_to :tasks
    else
      flash[:error_notice] = "スケジュールを更新できませんでした"
      render 'edit'
    end
  end
  
  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end

end
