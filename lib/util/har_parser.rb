require 'fileutils'
require 'csv'
require 'har'

module HarParser

	def view_har_file
		har_location = "#{File.dirname(__FILE__)}"+"/../../artifacts/har/"
		puts har_location
		sorted = Dir.entries(har_location).sort_by {|f|
		File.ctime(File.join(har_location,f))
		}
		latest_har = sorted.last

		Dir.entries(har_location).each do|f|
			if !File.directory?(f)
				if(f != latest_har)
					entire_path = "#{har_location + f}"
					File.delete(entire_path)
				end
			end
		end
		latest_file =  "#{har_location + latest_har}"
		exec "har "+ "\""+"#{latest_file}" + "\""
	end

	def har_parser
		csv_path = "myfile.csv"
		har_location = ""+File.dirname(__FILE__)+"/../../artifacts/har/"
		CSV.open("#{har_location + csv_path}", "w") do |csv|
			Dir.entries(har_location).each do |s|
				if !File.directory?(s)
				list = [] #= Hash.new
				i = 0
				File.open("#{my_path + s}", 'r').each_line do |line|
					start_date_time = line.match(/["][s][t][a][r][t][e][d][D][a][t][e][T][i][m][e]["][:][ ]["][0-3]{1,4}[-][0-2]{1,2}[-][0-9]{1,2}[T][0-9]{1,2}[:][0-9]{1,2}[:][0-9]{1,2}[.][0-9]{1,3}[+][0-9]{1,2}[:][0-9]{1,2}["]/)
					time_taken = line.match(/["][t][i][m][e]["][:][ ][\d]{1,9}/)
					url = line.match(/["][u][r][l]["][:][ ]["](\S+\.(com|net|org|edu|gov)(\/\S+)?)["]/)

					if(start_date_time != nil)
						list[i] = start_date_time
					end
					if(time_taken != nil)
						list[i] = time_taken
					end
					if(url != nil)
						list[i] = url
					end
					i = i + 1
					start_date_time = nil
					time_taken  = nil
					url = nil
				end  # End of Reading all Lines in File
				x = i
				puts x
				list.delete(nil)
				y = 0
				z = list.length
				b = (z/3)
				b.times do
					csv << [list[y], list[y+1],list[y+2]]
					y = y + 3
				end
				end # End of If
			end # End of reading all HAR Files in the Directory
		end #End of writing the CSV and closing it
	end
end
