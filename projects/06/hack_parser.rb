require './hack'
class Parser
  include Enumerable
  def each
    @commands.each do |x|
      yield x
    end
  end

  def symbol_table
    Hack::Command.symbol_table
  end

  def initialize(file)
    @file = file
    @commands = []
    parse
    allocate_variables
  end

  private

  def allocate_variables
    @commands.select { |c| c.type == :A }.each(&:process)
  end

  def parse
    line_number = -1
    @file.each_line do |line|
      next if line =~ %r{^\s*$}
      next if line =~ %r{^\s*//.*}

      line_number += 1
      command = line.split(%r{//})[0].strip
      if command =~ /\(.+\)/
        line_number -= 1
        @commands << Hack::L_Command.new(command[1..-2], line_number + 1)
        next
      end
      if command.start_with? '@'
        @commands << Hack::A_Command.new(command[1..-1])
        next
      end
      @commands << Hack::C_Command.new(command)
    end
  end
end
