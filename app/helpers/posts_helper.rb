module PostsHelper

  def preview(post)

    html = "<h2>#{link_to post.title, post_path(post.id)} "
    html += "<small>#{post.timestamp}</small></h2>"
    html += "<article class='preview'>#{content_preview(post)}</article>"
    html += "<article class='full'>#{post.content}</article>"
    html.html_safe

  end

  private

    def content_preview(post)
      post.content.length < 500 ? post.content : /\A.{500}\S*/m.match(post.content).to_s + " ... "
    end

end
