require 'spec_helper'

describe Starcraft2::Profile::Ladders do
  let(:ladder) { Starcraft2::Profile::Ladders.new(@options)}

  before do
    @options = {}
  end

  it 'should set the current_season' do
    @options = { :current_season => [{
                 :ladder => [{
                   :ladderName => "Shuttle Tango",
                   :ladderId => 153300,
                   :division => 34,
                   :rank => 28,
                   :league => "PLATINUM",
                   :matchMakingQueue => "HOTS_TWOS",
                   :wins => 7,
                   :losses => 1,
                   :showcase => true
                 }],
                 :characters => [{
                   :id => 999000,
                   :realm => 1,
                   :displayName => "DayNine",
                   :clanName => "Team 9",
                   :clanTag => "Nine",
                   :profilePath => "/profile/999000/1/DayNine/"
                 }, {
                   :id => 1283116,
                   :realm => 1,
                   :displayName => "megumixbear",
                   :clanName => "",
                   :clanTag => "",
                   :profilePath => "/profile/1283116/1/megumixbear/"
                 }],
                 :nonRanked => []
               }, {
                 :ladder => [{
                   :ladderName => "Torrasque Upsilon",
                   :ladderId => 154764,
                   :division => 59,
                   :rank => 90,
                   :league => "PLATINUM",
                   :matchMakingQueue => "HOTS_TWOS",
                   :wins => 4,
                   :losses => 1,
                   :showcase => true
                 }],
                 :characters => [{
                   :id => 999000,
                   :realm => 1,
                   :displayName => "DayNine",
                   :clanName => "Team 9",
                   :clanTag => "Nine",
                   :profilePath => "/profile/999000/1/DayNine/"
                 }, {
                   :id => 788150,
                   :realm => 1,
                   :displayName => "JPMcD",
                   :clanName => "itme",
                   :clanTag => "itme",
                   :profilePath => "/profile/788150/1/JPMcD/"
                 }],
                 :nonRanked => []
               }]}
    ladder.current_season.class.should == Array
    ladder.current_season.first.class.should == Starcraft2::Profile::DetailedSeason
    ladder.current_season.first.ladder.class.should == Array
    ladder.current_season.first.ladder.first.class.should == Starcraft2::Profile::Ladder

    ladder.current_season.first.ladder.first.ladder_name.should == "Shuttle Tango"
    ladder.current_season.first.ladder.first.ladder_id.should == 153300
    ladder.current_season.first.ladder.first.division.should == 34
    ladder.current_season.first.ladder.first.rank.should == 28
    ladder.current_season.first.ladder.first.league.should == "PLATINUM"
    ladder.current_season.first.ladder.first.match_making_queue.should == "HOTS_TWOS"
    ladder.current_season.first.ladder.first.wins.should == 7
    ladder.current_season.first.ladder.first.losses.should == 1

    ladder.current_season.first.characters.class.should == Array
    ladder.current_season.first.characters.first.id.should == 999000
    ladder.current_season.first.characters.first.realm.should == 1
    ladder.current_season.first.characters.first.display_name.should == "DayNine"
    ladder.current_season.first.characters.first.clan_name.should == "Team 9"
    ladder.current_season.first.characters.first.clan_tag.should == "Nine"
    ladder.current_season.first.characters.first.profile_path.should == "/profile/999000/1/DayNine/"

    ladder.current_season.first.non_ranked.class.should == Array
    ladder.current_season.first.non_ranked.should == []
  end

  it 'should set the previous_season' do
    @options = { :previous_season => [{
                 :ladder => [],
                 :characters => [{
                   :id => 3113795,
                   :realm => 1,
                   :displayName => "Smix",
                   :clanName => "",
                   :clanTag => "",
                   :profilePath => "/profile/3113795/1/Smix/"
                 }, {
                   :id => 1283116,
                   :realm => 1,
                   :displayName => "megumixbear",
                   :clanName => "",
                   :clanTag => "",
                   :profilePath => "/profile/1283116/1/megumixbear/"
                 }],
                 :nonRanked => [{
                   :mmq => "HOTS_TWOS",
                   :gamesPlayed => 2
                 }]
               }, {
                 :ladder => [{
                   :ladderName => "Immortal Romeo",
                   :ladderId => 148509,
                   :division => 120,
                   :rank => 61,
                   :league => "DIAMOND",
                   :matchMakingQueue => "HOTS_SOLO",
                   :wins => 11,
                   :losses => 2,
                   :showcase => false
                 }],
                 :characters => [{
                   :id => 1283116,
                   :realm => 1,
                   :displayName => "megumixbear",
                   :clanName => "",
                   :clanTag => "",
                   :profilePath => "/profile/1283116/1/megumixbear/"
                 }],
                 :nonRanked => []
               }]
               }

  end

  it 'should set the showcase_placement' do

  end

end
