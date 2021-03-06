class ExistingSchema < ActiveRecord::Migration
  def self.up
    create_table "ArtGame", :id => false do |t|
      t.column "ArtID",  :integer, :default => 0, :null => false
      t.column "GameID", :integer, :default => 0, :null => false
    end

    add_index "ArtGame", ["ArtID"], :name => "ArtID"
    add_index "ArtGame", ["GameID"], :name => "GameID"

    create_table "Articles", :id => false do |t|
      t.column "ArtID",     :integer,                              :null => false
      t.column "Headline",  :string,               :default => "", :null => false
      t.column "Body",      :text,                 :default => "", :null => false
      t.column "Summary",   :string,               :default => "", :null => false
      t.column "DateAdded", :date,                                 :null => false
      t.column "UserID",    :integer,              :default => 0,  :null => false
      t.column "Active",    :integer, :limit => 4, :default => 0,  :null => false
      t.column "E3year",    :integer, :limit => 4, :default => 0,  :null => false
      t.column "ArtCat",    :string,               :default => "", :null => false
      t.column "image1",    :string,               :default => "", :null => false
      t.column "image2",    :string,               :default => "", :null => false
      t.column "image3",    :string,               :default => "", :null => false
      t.column "image4",    :string,               :default => "", :null => false
      t.column "image5",    :string,               :default => "", :null => false
      t.column "image6",    :string,               :default => "", :null => false
      t.column "image7",    :string,               :default => "", :null => false
      t.column "image8",    :string,               :default => "", :null => false
      t.column "image9",    :string,               :default => "", :null => false
      t.column "image10",   :string,               :default => "", :null => false
    end

    add_index "Articles", ["ArtCat"], :name => "ArtCat"

    create_table "ConsNews", :id => false do |t|
      t.column "NewsID",  :integer,              :default => 0,  :null => false
      t.column "Console", :string,  :limit => 5, :default => "", :null => false
    end

    add_index "ConsNews", ["Console", "NewsID"], :name => "Console", :unique => true
    add_index "ConsNews", ["NewsID"], :name => "NewsID"

    create_table "ConsPR", :id => false do |t|
      t.column "PRID",    :integer,              :default => 0,  :null => false
      t.column "Console", :string,  :limit => 5, :default => "", :null => false
    end

    add_index "ConsPR", ["PRID", "Console"], :name => "OnlyOnce", :unique => true
    add_index "ConsPR", ["PRID"], :name => "PRID"
    add_index "ConsPR", ["Console"], :name => "Console"

    create_table "DevNews", :id => false do |t|
      t.column "DevID",  :integer, :default => 0, :null => false
      t.column "NewsID", :integer, :default => 0, :null => false
    end

    create_table "DevPR", :id => false do |t|
      t.column "PRID",  :integer, :default => 0, :null => false
      t.column "DevID", :integer, :default => 0, :null => false
    end

    add_index "DevPR", ["PRID", "DevID"], :name => "OnlyOnce", :unique => true
    add_index "DevPR", ["PRID"], :name => "PRID"
    add_index "DevPR", ["DevID"], :name => "DevID"

    create_table "Developers", :id => false do |t|
      t.column "DevID", :integer, :limit => 10,                  :null => false
      t.column "Name",  :string,  :limit => 200, :default => "", :null => false
      t.column "URL",   :string,  :limit => 200
    end

    add_index "Developers", ["Name"], :name => "Name", :unique => true

    create_table "Features", :id => false do |t|
      t.column "GameID",      :integer, :default => 0,     :null => false
      t.column "480P",        :boolean, :default => false, :null => false
      t.column "720P",        :boolean, :default => false, :null => false
      t.column "1080I",       :boolean, :default => false, :null => false
      t.column "dolby",       :boolean, :default => false, :null => false
      t.column "soundtrack",  :boolean, :default => false, :null => false
      t.column "onlineplay",  :boolean, :default => false, :null => false
      t.column "dlc",         :boolean, :default => false, :null => false
      t.column "scoreboard",  :boolean, :default => false, :null => false
      t.column "splitscreen", :boolean, :default => false, :null => false
      t.column "systemlink",  :boolean, :default => false, :null => false
      t.column "players",     :boolean, :default => true,  :null => false
      t.column "arcadestick", :boolean, :default => false, :null => false
      t.column "lightgun",    :boolean, :default => false, :null => false
      t.column "wheel",       :boolean, :default => false, :null => false
    end

    create_table "GameLinks", :id => false do |t|
      t.column "GameID", :integer, :default => 0, :null => false
      t.column "LinkID", :integer, :default => 0, :null => false
    end

    add_index "GameLinks", ["GameID", "LinkID"], :name => "GameID"
    add_index "GameLinks", ["LinkID"], :name => "LinkIndex"

    create_table "GameNews", :id => false do |t|
      t.column "GameID", :integer, :default => 0, :null => false
      t.column "NewsID", :integer, :default => 0, :null => false
    end

    add_index "GameNews", ["GameID", "NewsID"], :name => "GameID", :unique => true
    add_index "GameNews", ["GameID"], :name => "GameID_2"
    add_index "GameNews", ["NewsID"], :name => "NewsID"

    create_table "GamePR", :id => false do |t|
      t.column "PRID",   :integer, :default => 0, :null => false
      t.column "GameID", :integer, :default => 0, :null => false
    end

    add_index "GamePR", ["PRID", "GameID"], :name => "OnlyOnce", :unique => true
    add_index "GamePR", ["PRID"], :name => "PRID"
    add_index "GamePR", ["GameID"], :name => "GameID"

    create_table "Games", :id => false do |t|
      t.column "GameID",       :integer,                                :null => false
      t.column "Title",        :string,  :limit => 100, :default => "", :null => false
      t.column "Console",      :string,  :limit => 15,  :default => "", :null => false
      t.column "DevID",        :integer
      t.column "PubID",        :integer
      t.column "SiteURL",      :string
      t.column "BoximagePath", :string
      t.column "Description",  :text
      t.column "ESRB",         :string,  :limit => 2
      t.column "AvgReview",    :integer, :limit => 4
      t.column "GenreID",      :integer,                :default => 0,  :null => false
      t.column "AddedBy",      :integer,                :default => 0,  :null => false
      t.column "DateAdded",    :date,                                   :null => false
      t.column "LastEditedBy", :integer,                :default => 0,  :null => false
      t.column "DateEdited",   :date,                                   :null => false
      t.column "AssignedTo",   :integer,                :default => 0,  :null => false
      t.column "Verified",     :date,                                   :null => false
      t.column "E304",         :integer, :limit => 4,   :default => 0,  :null => false
    end

    add_index "Games", ["Title", "Console"], :name => "NoDups", :unique => true
    add_index "Games", ["Title"], :name => "Title"
    add_index "Games", ["E304"], :name => "E304"
    add_index "Games", ["Description"], :name => "descrip"

    create_table "Genres", :id => false do |t|
      t.column "GenreID", :integer,                               :null => false
      t.column "TYPE",    :string,  :limit => 16, :default => "", :null => false
    end

    create_table "LinkTypes", :id => false do |t|
      t.column "TypeID", :integer,                               :null => false
      t.column "Type",   :string,  :limit => 10, :default => "", :null => false
    end

    create_table "Links", :id => false do |t|
      t.column "LinkID",      :integer,                               :null => false
      t.column "TypeID",      :integer,               :default => 0,  :null => false
      t.column "SiteName",    :string,  :limit => 50, :default => "", :null => false
      t.column "SiteURL",     :string,                :default => "", :null => false
      t.column "Synopsis",    :text
      t.column "Rating",      :string,  :limit => 50
      t.column "RatingValue", :integer
      t.column "DateAdded",   :date,                                  :null => false
      t.column "UserID",      :integer, :limit => 8,  :default => 0,  :null => false
    end

    add_index "Links", ["TypeID"], :name => "TypeIndex"

    create_table "News", :id => false do |t|
      t.column "NewsID",    :integer,                                :null => false
      t.column "Headline",  :string,                 :default => "", :null => false
      t.column "FrontPage", :string,   :limit => 26, :default => "", :null => false
      t.column "Body",      :text,                   :default => "", :null => false
      t.column "Summary",   :string,                 :default => "", :null => false
      t.column "DateAdded", :datetime,                               :null => false
      t.column "UserID",    :integer,  :limit => 8,  :default => 0,  :null => false
      t.column "E3year",    :integer,  :limit => 4,  :default => 0,  :null => false
      t.column "Active",    :integer,  :limit => 4,  :default => 0,  :null => false
    end

    add_index "News", ["E3year"], :name => "E3year"
    add_index "News", ["DateAdded", "Active"], :name => "DateActive"
    add_index "News", ["Active"], :name => "Active"
    add_index "News", ["NewsID", "DateAdded", "Active"], :name => "test"

    create_table "PressReleases", :id => false do |t|
      t.column "PRID",      :integer,                 :null => false
      t.column "Headline",  :string,  :default => "", :null => false
      t.column "Subhead",   :string
      t.column "Body",      :text,    :default => "", :null => false
      t.column "Summary",   :text
      t.column "DateAdded", :date,                    :null => false
      t.column "UserID",    :integer, :default => 0
    end

    create_table "PubNews", :id => false do |t|
      t.column "PubID",  :integer, :default => 0, :null => false
      t.column "NewsID", :integer, :default => 0, :null => false
    end

    add_index "PubNews", ["PubID", "NewsID"], :name => "PubID", :unique => true

    create_table "PubPR", :id => false do |t|
      t.column "PRID",  :integer, :default => 0, :null => false
      t.column "PubID", :integer, :default => 0, :null => false
    end

    add_index "PubPR", ["PRID", "PubID"], :name => "OnlyOnce", :unique => true
    add_index "PubPR", ["PRID"], :name => "PRID"
    add_index "PubPR", ["PubID"], :name => "PubID"

    create_table "Publishers", :id => false do |t|
      t.column "PubID", :integer, :limit => 10,                  :null => false
      t.column "Name",  :string,  :limit => 200, :default => "", :null => false
      t.column "URL",   :string,  :limit => 200
    end

    add_index "Publishers", ["Name"], :name => "Name", :unique => true

    create_table "ReleaseDates", :id => false do |t|
      t.column "GameID",      :integer, :default => 0,     :null => false
      t.column "Released",    :boolean, :default => false, :null => false
      t.column "ReleaseDate", :date
      t.column "Gold",        :boolean, :default => false, :null => false
      t.column "GoldDate",    :date
      t.column "COMMENT",     :text
    end

    add_index "ReleaseDates", ["ReleaseDate"], :name => "ReleaseIndex"

    create_table "Reviews", :id => false do |t|
      t.column "ReviewID",        :integer,                                       :null => false
      t.column "GameID",          :integer,               :default => 0,          :null => false
      t.column "Rank",            :integer, :limit => 4
      t.column "UserID",          :integer,               :default => 0,          :null => false
      t.column "Active",          :integer, :limit => 4,  :default => 0,          :null => false
      t.column "DateAdded",       :date,                                          :null => false
      t.column "Introduction",    :text
      t.column "Screenshot1",     :string
      t.column "GraphicScore",    :integer, :limit => 4
      t.column "GraphicComment",  :string
      t.column "GraphicText",     :text
      t.column "Screenshot2",     :string
      t.column "SoundScore",      :integer, :limit => 4
      t.column "SoundComment",    :string
      t.column "SoundText",       :text
      t.column "Screenshot3",     :string
      t.column "ControlScore",    :integer, :limit => 4
      t.column "ControlComment",  :string
      t.column "ControlText",     :text
      t.column "Screenshot4",     :string
      t.column "GameplayScore",   :integer, :limit => 4
      t.column "GameplayComment", :string
      t.column "GameplayText",    :text
      t.column "Screenshot5",     :string
      t.column "ValueScore",      :integer, :limit => 4
      t.column "ValueComment",    :string
      t.column "ValueText",       :text
      t.column "Screenshot6",     :string
      t.column "Conclusion",      :text
      t.column "Pros",            :text
      t.column "Cons",            :text
      t.column "GameWas",         :string,  :limit => 10, :default => "Provided"
    end

    add_index "Reviews", ["GameID"], :name => "GameIndex"
    add_index "Reviews", ["DateAdded"], :name => "DateIndex"

    create_table "Users", :id => false do |t|
      t.column "userID",          :integer,  :limit => 8,                                       :null => false
      t.column "username",        :string,   :limit => 20,  :default => "",                     :null => false
      t.column "password",        :string,   :limit => 20,  :default => "",                     :null => false
      t.column "firstname",       :string,   :limit => 30,  :default => "",                     :null => false
      t.column "lastname",        :string,   :limit => 30,  :default => "",                     :null => false
      t.column "status",          :string,   :limit => 10,  :default => "",                     :null => false
      t.column "email",           :string,   :limit => 100, :default => "news@consolegold.com"
      t.column "last_login_ip",   :string,   :limit => 15
      t.column "last_login_host", :string,   :limit => 100, :default => "",                     :null => false
      t.column "last_login_dt",   :datetime,                                                    :null => false
    end

    add_index "Users", ["username"], :name => "username"

    create_table "screenshots", :id => false do |t|
      t.column "shotID",    :integer, :limit => 20,                   :null => false
      t.column "filepath",  :string,                :default => "",   :null => false
      t.column "filename",  :string,                :default => "",   :null => false
      t.column "caption",   :text,                  :default => "",   :null => false
      t.column "GameID",    :integer,               :default => 0,    :null => false
      t.column "DateAdded", :date,                                    :null => false
      t.column "E3year",    :integer, :limit => 4,  :default => 2006, :null => false
    end

    add_index "screenshots", ["GameID"], :name => "GameID"
    add_index "screenshots", ["DateAdded"], :name => "dateadded"
    add_index "screenshots", ["GameID", "DateAdded"], :name => "gamedate"
  end

  def self.down
  end
end
