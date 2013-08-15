module Starcraft2
  class Profile
    class DetailedSeason
      attr_accessor :ladder, :characters, :non_ranked

      def initialize(options = {})
        Utils.load(self, options, {}, { :ladder => ::Starcraft2::Profile::Ladder, :characters => ::Starcraft2::Character, :non_ranked => NonRank })
      end

      def self.build(detailed_season_data)
        detailed_season_data.map do |ds|
          new(ds)
        end
      end
    end
  end
end
