class HackerIpsum

  def post
    {
      title: sentence,
      body: sentences(100),
      published?: published,
      published_at: @published ? timestamp : nil,
      updated_at: timestamp,
      created_at: earlier
    }
  end

  def blurb
    {
      body: trimmed,
      updated_at: timestamp,
      created_at: timestamp
    }
  end

  def resource
    {
      title: Faker::Company.catch_phrase,
      author: Faker::Name.name,
      url: Faker::Internet.url
    }
  end

  def concept
    {
      name: [
        Faker::Hacker.abbreviation,
        Faker::Hacker.adjective,
        Faker::Hacker.noun,
        Faker::Hacker.verb,
        Faker::Hacker.ingverb
      ].sample
    }
  end

  private

    def sentence
      sentences(1)
    end

    def sentences(n)
      l33t = ""
      n.times { l33t += "#{Faker::Hacker.say_something_smart.capitalize} " }
      l33t[0...-1]
    end

    def trimmed
      /!.*/.match(sentences(3)[0..255].reverse).to_s.reverse
    end

    def published
      @published = [true, false].sample
    end

    def timestamp
      Faker::Time.backward(30)
    end

    def earlier
      Faker::Time.between(timestamp - 2.days, timestamp)
    end
  end
