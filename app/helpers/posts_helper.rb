module PostsHelper

  def headline(post)
    @post = post

    html = "<h2>#{link_to @post.title, post_path(@post.id)} "
    html += "<small>#{timestamp} #{admin_links}</small></h2>"
    html.html_safe
  end

  def preview(post)
    @post = post

    html = "<div class='preview-div'>#{headline(post)}"
    html += "<article class='preview-article'>#{content_preview}</article>"
    html += "<article class='full-article'>#{@post.content}</article>"
    html += "</div>"
    html.html_safe
  end

  private

    def content_preview
      @post.content.length < 500 ? @post.content : /\A.{500}\S*/m.match(@post.content).to_s + " ... "
    end

    def timestamp
      @post.timestamp.strftime('%-d %B %Y')
    end

    def admin_links
      "#{link_to 'edit', edit_post_path(@post)} #{link_to 'delete', post_path(@post), method: :delete}" if me?
    end
end
