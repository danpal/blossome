module Galleta
  class MarkdownHelpers < Mustache

  def vimeoVideo(video_id)
    html = '<div class="video">'
    html += "<iframe src=\"http://player.vimeo.com/video/#{video_id}\" width=\"640px\" height=\"420px\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>"
    html += '</div>'
    return html
  end
 
   def insertImage(image)
    html = '<div class="image">'
    html += "<img src=\"/assets/posts/#{image}\">"
    html += '</div>'
    return html
  end
  
  
   def insertImageRight(image)
    html = '<div class="image-right">'
    html += "<img src=\"/assets/posts/#{image}\">"
    html += '</div>'
    return html
  end
  
 
  

  end
end
