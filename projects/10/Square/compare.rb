require 'nokogiri'
require 'nokogiri/diff'
require 'compare-xml'
doc1=Nokogiri::XML(File.read(ARGV[0])) do |config|
  config.default_xml.noblanks
end
doc2=Nokogiri::XML(File.read(ARGV[1])) do |config|
  config.default_xml.noblanks
end
doc1.diff(doc2) do |change,node|
  puts "#{change} #{node.to_html}".ljust(30) + node.parent.path
end
puts CompareXML.equivalent?(doc1, doc2)
