module SC2
  class Achievement
    attr_accessor :title, :description, :achievement_id, :category_id, :points, :icon

    def initialize(options = {})
      options.each do |k,v|
        self.send(:"#{k.to_s.underscore}=", v)
      end
    end

    def self.build(raw_data)
      data = JSON.parse(raw_data)
      data['achievements'].map do |achievement|
        new(achievement)
      end
    end
  end
end
