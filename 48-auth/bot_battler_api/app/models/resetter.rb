class Resetter

  def self.generate_phrase
    phrase = []
    (30..50).to_a.sample.times do
      phrase << ["0", "1"].sample
    end

    phrase.join("")
  end


  def self.generate_name
    alphabet = ('A'..'z').to_a
    digits = ('0'..'9').to_a

    bot_name = ""

    [1,2,3].sample.times do 
      bot_name = bot_name + alphabet.sample
    end

    bot_name = bot_name + '-' + digits.sample + digits.sample
    bot_name
  end

  def self.generate_stats 
    bot_classes = ["Assault", "Defender", "Support"]
    high_range = (80..100).to_a
    medium_range = (40..80).to_a
    low_range = (20..40).to_a

    selected_class = bot_classes.sample

    stats = {}

    case selected_class 
      when "Assault"
        stats[:health] = medium_range.sample
        stats[:damage] = high_range.sample
        stats[:armor] = low_range.sample
      when "Defender"
        stats[:health] = medium_range.sample
        stats[:damage] = low_range.sample
        stats[:armor] = high_range.sample
      when "Support"
        stats[:health] = high_range.sample
        stats[:damage] = low_range.sample
        stats[:armor] = medium_range.sample
    end

    {stats: stats, bot_class: selected_class}

  end

  def self.generate_bots
    100.times do 

      info = self.generate_stats

      Bot.create({
        name: self.generate_name,
        health: info[:stats][:health],
        damage:info[:stats][:damage],
        armor: info[:stats][:armor],
        bot_class: info[:bot_class],
        catchphrase: self.generate_phrase,
        avatar_url: Faker::Avatar.image
        })
    end
  end

  def self.destroy
    Bot.destroy_all
  end

  def self.reset
    Resetter.destroy
    Resetter.generate_bots
    Resetter.generate_users
    Resetter.generate_relationships
  end


  def self.generate_users
    30.times do
      User.create(
        username: Faker::Games::Pokemon.unique.name,
        password: "123"
      )
    end
  end

  def self.generate_relationships
    200.times do
      UserBot.create(
        user_id: User.all.sample.id,
        bot_id: Bot.all.sample.id
      )
    end
  end



  
end