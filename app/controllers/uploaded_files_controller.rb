class UploadedFilesController < ApplicationController
  def index
    @files = UpladedFile.all
  end

  def new
    @file = UpladedFile.new
  end

  def create
    @file = UpladedFile.new(file_params)

    if @file.save
      flash[:success] = 'File created'
      redirect_to uploaded_files_path
    else
      render :new
    end
  end

  private

  def file_params
    params.require(:upladed_file).permit(:name, :attachment)
  end
end
