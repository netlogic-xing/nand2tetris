require './hack'
require './hack_parser'
require 'optparse'
options = {}

o = OptionParser.new do |opts|
  OptionParser::Version = [1, 0, 0]
  opts.banner = 'Usage: compiler.rb asmfile [options]'

  opts.on('-g', '--generate-symbol-table', 'Generate symbol table') do |g|
    options[:generate_symbol] = g
  end

  opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
    options[:verbose] = v
  end
  # No argument, shows at tail.  This will print an options summary.
  # Try it and see!
  opts.on_tail('-h', '--help', 'Show this message') do
    puts opts
    exit
  end

  # Another typical switch to print the version.
  opts.on_tail('--version', 'Show version') do
    puts OptionParser::Version.join('.')
    exit
  end
end

begin
  o.parse! ARGV
rescue OptionParser::InvalidOption => e
  puts e
  puts o
  exit 1
end

if ARGV.empty?
  puts 'No vmfile!'
  puts o
  exit(1)
end
vm_file = File.new(ARGV[0], 'r')
asm_file = File.new(ARGV[0].sub(/\.vm/, '.asm'), 'w+')
parser = Parser.new vm_file
parser.each do |c|
  asm_file.puts c.compile.gsub(/^\s*/,"")
  if options[:verbose]
    puts "//#{c.text}"
    puts "#{c.compile.gsub(/^\s*/,"")}"
  end
end
if options[:generate_symbol]
  File.open(ARGV[0].sub(/\.asm/, '.tbl'), 'w+') do |f|
    parser.symbol_table.each do |k, v|
      f.puts "#{k}=>#{v}"
    end
  end
end
vm_file.close
asm_file.close
