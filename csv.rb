class CSV  
  def self.read(file_name)
    File.new(file_name, 'r').each_line.map{|i| i.split(",").map{ |a| a.empty? ? nil : a } } 
  end  
end