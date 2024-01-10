class UploadedFilesController < ApplicationController
  before_action :set_file, only: %i[destroy show]
  before_action :set_all_files, only: %i[storage index]
  before_action :calculate_total_size, only: %i[storage index]


  helper ApplicationHelper

  def index
    set_trash
    calculate_total_size

    @files = @files.where("name LIKE ?", "%#{params[:search]}%").where.not(id: @files_trash.pluck(:id))
  end

  
  def search
    @results = UploadedFile.where("name LIKE ?", "%#{params[:query]}%")
  end

  def history
    @files_history = UploadedFile.order(created_at: :desc)

    @files_history.each do |file|
      file.define_singleton_method(:created_recently?) do
        created_at >= 1.hour.ago
      end
    end

    @files_history = @files_history.sort_by { |file| [file.created_recently? ? 0 : 1, file.created_at] }.reverse
  end

 
  

  def settings
  end

  def storage
    calculate_total_size
    @progress_percentage = (@all_size.to_f / 15.gigabytes) * 100
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
    handle_file_deletion
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

  def calculate_total_size
    @all_size = @size_in_bytes.sum
  end

  def set_all_files
    @files = UploadedFile.where(deleted: false)
    set_size_in_bytes
  end

  def set_size_in_bytes
    @size_in_bytes = @files.map { |file| file.attachment.file.size  }
  end

  def set_trash
    @files_trash = UploadedFile.where(deleted: true)
  end

  def file_params
    params.require(:uploaded_file).permit(:name, :attachment)
  end

  def set_file
    @file = UploadedFile.find(params[:id])
  end

  def handle_file_deletion
    if params[:restore] && @file.update(deleted: false)
      flash[:success] = 'File restored'
      redirect_to trash_uploaded_files_path
    else
      @file.update(deleted: true)
      flash[:success] = 'File moved to trash'
      redirect_to uploaded_files_path
    end
  end
end
