#coding: utf-8
require 'csv'  
namespace :houseinfo do
  desc "TODO"
  task :update_area => :environment do

    CSV.foreach('/Users/dreamlinx/NetBeansProjects/houseinfo2/db/house.csv', :headers => true) do |row|

      #Room.change_area(row['building_title'], row['model_title'], row['area1'].to_f, row['area2'].to_f)
      rooms = Room.includes(:building, :room_model).where("buildings.title = ? and room_models.title = ?", row['building_title'].strip,row['model_title'].strip)
      puts rooms.size
      rooms.each do |room|
        if room.room_no <= 101
          room.update_attribute(:area, row['area1'].strip)
          puts room.room_no
        else
          room.update_attribute(:area, row['area2'].strip)
        end
      end
      puts 'all records updated'
    end
    
  end

end
