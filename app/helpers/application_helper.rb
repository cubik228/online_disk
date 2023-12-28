module ApplicationHelper
  def image_file?(url)
    url =~ /\.(png|jpg|jpeg|gif|bmp)\z/i
  end
end
