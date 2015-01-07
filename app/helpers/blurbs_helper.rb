module BlurbsHelper

  def body(text)
    text.body
  end

  def count(text)
    text.body.count('!')
  end

end
