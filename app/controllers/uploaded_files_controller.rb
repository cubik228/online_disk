class UploadedFilesController < ApplicationController
  before_action :set_file!, only: %i[destroy show]
  before_action :set_all_file!, only: %i[storage index]
  before_action :set_size_file!, only: %i[storage index]

  def index
    @files = @files.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def history
    @files_history = UpladedFile.all.order(created_at: :desc)
  end

  def storage
    @all_size = 0 

    @size_in_bytes.each do |size|
      @all_size += size
    end
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

  def set_size_file!
    @size_in_bytes = []

    @files.each do |file|
      @size_in_bytes << file.attachment.file.size / 1000
    end
  end

  def set_all_file!
    @files = UpladedFile.all
  end

  def file_params
    params.require(:upladed_file).permit(:name, :attachment)
  end

  def set_file!
    @file = UpladedFile.find(params[:id])
  end
end
