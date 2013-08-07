require "spec_helper"

describe SC2::Achievement do
  describe "#build_achievements" do
    let(:achievements) { SC2::Achievement.build_achievements(@raw_achievement_data)}

    before do
      VCR.use_cassette('achievements') do
      end
    end

    it "should build an array of achievements" do
      achievements.class.should == Array
      achievements.each do |a|
        a.class.should == SC2::Achievement
      end
    end
  end

  describe ".initialize" do
    let(:achievement) {SC2::Achievement.new(@options)}

    before do
      @options = {}
    end

    it "should store the title" do
      @options = {:title => "Test Title"}
      achievement.title.should == "Test Title"
    end

    it "should store the description" do
      @options = {:description => "Description"}
      achievement.description.should == "Description"
    end

    it "should store the achievement id" do
      @options = {:achievement_id => 5}
      achievement.achievement_id.should == 5
    end

    it "should store the category id" do
      @options = {:category_id => 10}
      achievement.category_id.should == 10
    end

    it "should store the points" do
      @options = {:points => 5}
      achievement.points.should == 5
    end

    it "should store the icon data" do
      @options = {:icon => {:x => 1, :y => 2, :w => 3, :h => 4, :offset => 0, :url => "http://example.com"}}
      achievement.icon.should == {:x => 1, :y => 2, :w => 3, :h => 4, :offset => 0, :url => "http://example.com"}
    end
  end
end