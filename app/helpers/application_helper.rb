module ApplicationHelper
  def image_file?(url)
    url =~ /\.(png|jpg|jpeg|gif|bmp)\z/i
  end

  def created_recently_label(created_recently)
    if created_recently
      "(Created recently)"
    else
      "(Created more than an hour ago)"
    end
  end
end
