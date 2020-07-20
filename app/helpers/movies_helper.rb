module MoviesHelper
  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

  def shared_by(user_id)
    user = User.find_by(id: user_id)
    user ? user.email : "-"
  end
end
