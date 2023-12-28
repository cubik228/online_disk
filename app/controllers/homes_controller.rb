# Контроллер для управления домами.
class HomesController < ApplicationController
  # Ваш код контроллера здесь
  def index
    @files = UpladedFile.all
  end
end
