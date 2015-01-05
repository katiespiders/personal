class HackerIpsum
  def hacker_sentence
    hacker_sentences(1)
  end

  def hacker_sentences(n)
    l33t = ""
    n.times { l33t += "#{Faker::Hacker.say_something_smart} " }
    l33t
  end

  def hacker_snippet
    /!.*/.match(hacker_sentences(3).reverse).to_s.reverse
  end

  def published
    [true, false].sample
  end

  def timestamp
    Faker::Time.backward(30)
  end

  def earlier
    Faker::Time.between(timestamp - 2.days, timestamp)
  end
