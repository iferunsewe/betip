module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def randomized_background_image
    images = ["arsenal-tottenham.jpg", "chelsea-spurs.jpg", "city-utd.jpg", "everton-west_ham.jpg", "liverpool-city.jpg", "newcastle-sunderland.jpg", "palace-liverpool.jpg"]
    images[rand(images.size)]
  end
end
