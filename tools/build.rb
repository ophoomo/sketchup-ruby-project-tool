
require "fileutils"
require "pathname"
require "zip"
require "json"

@path = File.expand_path('..', __dir__)

# build data
def build()
	
	# input data
	input_argv = ARGV
	
	if input_argv.empty?
		type = "rbz"
	else
		type = input_argv[0]
	end
	
	p "[Tool] builing data..."
	p "[Tool] Creating RBZ archive..."
	file = File.read('@/../setting.json')
	data_hash = JSON.parse(file)
	
	rbfile = File.join(@path+"/src/**", "*")
	Zip::File.open(@path+"/build/#{data_hash['name']} #{data_hash['version']}.#{type}", Zip::File::CREATE) do |zipfile|
		files = Dir.glob(rbfile)
		files.each do |item|
			next if File.directory?(item)
			pathname = Pathname.new(item)
			relative_name = pathname.relative_path_from(@path+"/src/")
			puts "Archiving: #{relative_name}"
			zipfile.add(relative_name, item)
		end
	end
end

# check folder build
p "[Tool] check folder build"
if File.directory?(@path+"/build")
	p "[Tool] remove folder build"
	# remove folder build
	FileUtils.rm_rf(@path+"/build")
	# create folder build
	p "[Tool] create folder build"
	Dir.mkdir(@path+"/build")
	# build data
	build()
else
	p "[Tool] create folder build"
	# create folder build
	Dir.mkdir(@path+"/build")
	# build data
	build()
end


