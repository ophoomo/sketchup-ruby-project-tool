
require "fileutils"

# input data
input_argv = ARGV

# check input
if input_argv.empty?
	p "[Tool] read file setting.json"
	file = File.read('@/../setting.json')
	data_hash = JSON.parse(file)
	if !data_hash["dev"].empty?
		input_argv.push(data_hash["dev"])
	else
		p "enter version sketchup"
		return
	end
end

path_src = File.expand_path('..', __dir__)+"/src/"
filename = Dir.entries(path_src)

input_argv.each do |item|
	path = ENV['appdata']+"\\SketchUp\\SketchUp #{item}\\SketchUp\\Plugins\\"
	filename.each do |namefile|
		if namefile != "." and namefile != ".."
			p "[Tool] check file in sketchup #{item}"
			if File.exist?(path+namefile)
				p "[Tool] remove file #{namefile}"
				FileUtils.rm_rf(path+namefile)
			end
		end
		
		
	end
	
end


