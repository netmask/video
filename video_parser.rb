require 'csv'
require 'date'

#just a pure simple ruby class as container
class Video
  attr_accessor :number, :name, :celebrity, :date, :tags
  
  def initialize(number, name, date, celebrity, tags)
    self.number = number
    self.name = name
    self.celebrity = celebrity
    self.date = date
    self.tags = tags 
  end
end

#Encapsulation class
class VideoData 
  
  attr_accessor :data
  
  def initialize
    self.data = {}
  end
  
  #Utility Methods
  def add_video(video)
    self.data[video.name] = video
  end
  
  def by_name(name)
    self.data[name]
  end
  
  def all
    self.data.values  
  end
  
  def load_csv(file) 
    begin 
      videos = CSV.read(file)            
      (1..videos.length).each do |a|         
        videos[a].fill(3..videos[a].length){|i| videos[a][i] == 'x' ?  videos[0].values_at(i).join.sub(":","_")  :  nil } 
        video_tags = videos[a].slice!(3..videos[a].length)
        add_video Video.new a, videos[a][0], Date.strptime(videos[a][1],"%d-%b-%y") , videos[a][2], video_tags.compact!        
      end
    rescue NoMethodError,ArgumentError
      #Nil pointers(empty lines or empty arrays) Bad format date . Can handle or ignore it  
    end
  end  
end


