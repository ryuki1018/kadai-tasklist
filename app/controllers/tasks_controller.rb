class TasksController < ApplicationController
    
    before_action :set_tasks, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end
    
    def show
       
    end
    
    def new
        @task = Task.new
    end
    
    def create
        @task = Task.new(task_params)
        
        if @task.save
            flash[:success] = 'タスクが正常に追加'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクが追加できませんでした'
            render :new
        end
    end
    
    def edit
        
    end
    
    def update
        
        
        if @task.update(task_params)
            flash[:success] = 'タスクが変更されました'
            redirect_to @task
        else
            flash.now[:danger] = 'タスクを更新できませんでした'
            render :edit
        end
    end
    
    def destroy
        
        @task.destroy
        
        flash[:success] = 'タスクは正常に削除されました'
        redirect_to tasks_url
    end
    
    # ストロングパラメータ
    private
    
    def task_params
        params.require(:task).permit(:content,:status)
    end
    
    def set_tasks
        @task = Task.find(params[:id])
    end
end
