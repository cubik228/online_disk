class UploadedFilesController < ApplicationController
  before_action :set_file!, only: %i[destroy show]
  before_action :set_all_file!, only: %i[storage index]
  before_action :set_size_file!, only: %i[storage index]

  def index
    set_all_file!  
    set_trash!    
  
    @files = @files.where.not(id: @files_trash.pluck(:id))
    @files = @files.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
  end

  def history
    @files_history = UploadedFile.all.order(created_at: :desc)
  end
  def settings
  end

  def storage
    @all_size = 0 

    @size_in_bytes.each do |size|
      @all_size += size
    end
  end

  def new
    @file = UploadedFile.new
  end

  def create
    @file = UploadedFile.new(file_params)

    if @file.save
      flash[:success] = 'File created'
      redirect_to uploaded_files_path
    else
      render :new
    end
  end

  def show
  end

  
  def destroy
    if params[:restore] && @file.update(deleted: false)
      flash[:success] = 'File restored'
      redirect_to trash_uploaded_files_path
    else
      @file.update(deleted: true)
      flash[:success] = 'File moved to trash'
      redirect_to uploaded_files_path
    end
  end

  
  def trash
    @files_trash = UploadedFile.where(deleted: true)
  end

  def empty_trash
    UploadedFile.where(deleted: true).destroy_all
    flash[:success] = 'Trash emptied'
    redirect_to trash_uploaded_files_path
  end
  private

  def set_size_file!
    @size_in_bytes = []

    @files.each do |file|
      @size_in_bytes << file.attachment.file.size / 1000
    end
  end

  def set_trash!
    @files_trash = UploadedFile.where(deleted: true)
  end
  
  def set_all_file!
    @files = UploadedFile.where(deleted: false)
  end

  def file_params
    params.require(:uploaded_file).permit(:name, :attachment)
  end

  def set_file!
    @file = UploadedFile.find(params[:id])
  end
end
