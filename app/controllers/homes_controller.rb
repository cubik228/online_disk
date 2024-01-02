# Контроллер для управления домами.
class HomesController < ApplicationController
  # Ваш код контроллера здесь
  def index
    @files = UploadedFile.all
  end
end
