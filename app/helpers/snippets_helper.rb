module SnippetsHelper

  def body(text)
    text.content
  end

  def count(text)
    text.content.count('!')
  end

end
