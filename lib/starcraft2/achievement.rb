module Starcraft2
  class Achievement
    attr_accessor :title, :description, :achievement_id, :category_id, :points, :icon

    def initialize(options = {})
      Utils.load(self, options, {:icon => Icon})
    end

    def self.build(data)
      data['achievements'].map do |achievement|
        new(achievement)
      end
    end
  end
end
