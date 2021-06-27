require './hack'
require './hack_parser'
require 'optparse'
options = {}

o = OptionParser.new do |opts|
  OptionParser::Version = [1, 0, 0]
  opts.banner = 'Usage: assembler.rb asmfile [options]'

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
  puts 'No asmfile!'
  puts o
  exit(1)
end
asm_file = File.new(ARGV[0], 'r')
hack_file = File.new(ARGV[0].sub(/\.asm/, '.hack'), 'w+')
parser = Parser.new asm_file
parser.reject { |c| c.type == :L }.each do |c|
  hack_file.puts c.value
  if options[:verbose]
    puts "#{c.value} // #{c.text} //#{c.type}"
  end
end
if options[:generate_symbol]
  File.open(ARGV[0].sub(/\.asm/, '.tbl'), 'w+') do |f|
    parser.symbol_table.each do |k, v|
      f.puts "#{k}=>#{v}"
    end
  end
end
hack_file.close
asm_file.close
