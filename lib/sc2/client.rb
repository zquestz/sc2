module SC2
  class Client
    ACHIEVEMENTS_PATH = "/api/sc2/data/achievements"
    REWARDS_PATH = "/api/sc2/data/rewards"
    LADDER_PATH = "/api/sc2/ladder/"

    attr_accessor :locale, :host

    def initialize(options)
      options.each do |k,v|
        self.send(:"#{k}=", v)
      end
    end

    def achievements
      Achievement.build(achievements_data)
    end

    def rewards
      Reward.build(rewards_data)
    end

    def ladder(id)
      fetch_ladder(host, id)
    end

    private

    def achievements_data
      HTTParty.get(achievements_url).body
    end

    def achievements_url
      "http://" + host + ACHIEVEMENTS_PATH + locale_param
    end

    def rewards_data
      HTTParty.get(rewards_url).body
    end

    def rewards_url
      "http://" + host + REWARDS_PATH + locale_param
    end

    def locale_param
      locale.nil? ? '' : "?locale=#{locale}"
    end

    def fetch_ladder(host, id)
      Ladder.build(ladder_data(host,id))
    end

    def ladder_data(host, id)
      HTTParty.get("http://" + host + LADDER_PATH + id.to_s).body
    end
  end
end
