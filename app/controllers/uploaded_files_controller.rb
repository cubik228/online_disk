class UploadedFilesController < ApplicationController
  before_action :set_file!, only: %i[destroy show]

  def index
    @files = UpladedFile.all
    @files = @files.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end
  
  

  def new
    @file = UpladedFile.new
  end

  def create
    @file = UpladedFile.new(file_params)

    if @file.save
      flash[:success] = 'File created'
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    
  end

  def destroy
    @file.destroy
    flash[:success] = 'File deleted'
    redirect_to root_path
  end
  
  private

  def file_params
    params.require(:upladed_file).permit(:name, :attachment)
  end

  def set_file!
    @file = UpladedFile.find(params[:id])
  end
end
