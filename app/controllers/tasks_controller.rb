class TasksController < ApplicationController
    include SessionsHelper
    before_action :set_tasks, only: [:show, :edit, :update, :destroy]
    before_action :require_user_logged_in, only: [:index, :show, :edit]
    
    def index
        if logged_in?
            @user = current_user
            @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(5)
        end
    end
    
    def show
       
    end
    
    def new
       @task = current_user.tasks.build
    end
    
    def create
        @task = current_user.tasks.new(task_params)
        
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
    
    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    end
end
