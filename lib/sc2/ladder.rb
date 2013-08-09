module SC2
  class Ladder
    LADDER_PATH = "/api/sc2/ladder/"
    def initialize(raw_data)
      data = JSON.parse(raw_data)
      data['ladderMembers'].map do |member|
        member['join_timestamp'] = member.delete('joinTimestamp')
        member['highest_rank'] = member.delete('highestRank')
        member['previous_rank'] = member.delete('previousRank')
        member['favorite_race'] = member.delete('favoriteRaceP1')
        Member.new(member)
      end
    end
  end
end
