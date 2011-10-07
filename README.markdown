## Installation 
I test the code on the following Rubies

 * Ruby 1.8.7 p249
 * Ruby 1.9.2 p290
 * JRuby 1.6.4 

## Workflow 

i defined 2 classes 
 
 * Video
 * VideoData

'Video' is a basic class container 

The main class is 'VideoData' which loads and process the cvs file, the main method is "load_csv" which calls the CSV class and then walk through the array for each line of the array of arrays as well  the first line contains the 'tags' that should replace the 'x' once it finds a match in a column replaces it with the value of line 1, after  that split the array from column 3 to the end of the array eliminates 'null's' then creates a new Video class and add it to a HashMap whose key is the name of video

# About NullCatching

The exceptions are catched but not actions as ben taken understanding that the loader is a 'batch' processor can't break all the operation because a single exception.

### Now we can use the utility methods

 * all
 * by_name 

'all' returns all the values of the HashMap as array

'by_name(video_name)' return the specific video object
 
## Example (test.rb)

	video_data = VideoData.new
	video_data.load_csv('video_data.csv')
	
	#all the data
	for video in video_data.all
		puts "#{video.name} #{video.date} #{video.celebrity} #{video.number}"
	end
	
	#single entry
	puts video_data.by_name("tSP3Yqqk1Vg").inspect
	
	