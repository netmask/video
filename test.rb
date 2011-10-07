require './video_parser'

video_data = VideoData.new
video_data.load_csv('video_data.csv')

for video in video_data.all
  as_tags = video.tags.empty? ? "." : ", additionally this video should have a list of tags #{video.tags.join(', ')}"
  as_celebrity = video.celebrity ? "and his celebrity is #{video.celebrity}": ""
  puts "Video #{video.number}: #{video.name} have a date of #{video.date}#{as_celebrity}#{as_tags}"
end

