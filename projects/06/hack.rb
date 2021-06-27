module Hack
  module Command
    def command_types
      [:A, :C, :L]
    end

    attr_accessor :type, :text, :value

    class << self
      def put_symbol(symbol, number)
        symbol_table[symbol.to_sym] = number.to_i.to_s(2).rjust(16, '0')
      end

      def create_variable(symbol)
        put_symbol(symbol, counter)
        inc_counter
        get_symbol(symbol)
      end

      def get_symbol(symbol)
        symbol_table[symbol.to_sym]
      end

      def symbol_table
        @symbol_table ||= {}
      end

      private

      def counter
        @counter ||= 16
      end

      def inc_counter
        @counter += 1
      end


    end

    #puts "initialize pre-defined symbols"
    symbol_table[:SP] = 0.to_s(2).rjust(16, '0')
    symbol_table[:LCL] = 1.to_s(2).rjust(16, '0')
    symbol_table[:ARG] = 2.to_s(2).rjust(16, '0')
    symbol_table[:THIS] = 3.to_s(2).rjust(16, '0')
    symbol_table[:THAT] = 4.to_s(2).rjust(16, '0')
    (0..15).each do |i|
      symbol_table["R#{i}".to_sym] = i.to_s(2).rjust(16, '0')
    end
    symbol_table[:SCREEN] = 16_384.to_s(2).rjust(16, '0')
    symbol_table[:KBD] = 24_576.to_s(2).rjust(16, '0')
    #puts symbol_table

    def initialize(text)
      @text = text
    end

    def process
      puts 'process instruction'
    end
  end
  class A_Command
    include Command

    def initialize(text)
      super text
      @type = :A
      @value = if text =~ /^\d+$/
                 text.to_i.to_s(2).rjust(16, '0')
               else
                 Command.get_symbol(text)
               end
    end

    def process
      @value ||= Command.get_symbol(@text)
      @value ||= Command.create_variable(@text)
    end

  end

  class C_Command
    include Command

    def initialize(text)
      super text
      @type = :C
      process_c_command
    end

    private

    def process_c_command
      comp_pattern = '((?:[DAM][\+\-]1)|(?:D[\+\-][AM])|(?:[AM]\-D)|(?:D[&\|][AM])|(?:\-[1DAM])|(?:![ADM])|(?:[01ADM]))'
      dest_pattern = '^(?:(M|D|MD|A|AM|AD|AMD)\s*=\s*)?'
      jump_pattern = '(?:\s*;\s*(JGT|JEQ|JGE|JLT|JNE|JLE|JMP))?$'
      cmd_pattern = /#{dest_pattern}#{comp_pattern}#{jump_pattern}/
      if parts = cmd_pattern.match(text)
        case parts[2]
        when '0'
          c = '101010'
        when '1'
          c = '111111'
        when '-1'
          c = '111010'
        when 'D'
          c = '001100'
        when 'A', 'M'
          c = '110000'
        when '!D'
          c = '001101'
        when '!A', '!M'
          c = '110001'
        when '-D'
          c = '001111'
        when '-A', '-M'
          c = '110011'
        when 'D+1'
          c = '011111'
        when 'A+1', 'M+1'
          c = '110111'
        when 'D-1'
          c = '001110'
        when 'A-1', 'M-1'
          c = '110010'
        when 'D+A', 'D+M'
          c = '000010'
        when 'D-A', 'D-M'
          c = '010011'
        when 'A-D', 'M-D'
          c = '000111'
        when 'D&A', 'D&M'
          c = '000000'
        when 'D|A', 'D|M'
          c = '010101'
        else
          raise "Unknown instruction #{parts[1]}"
        end
        a = parts[2].include?('M') ? 1 : 0
        d1 = parts[1]&.include?('A') ? 1 : 0
        d2 = parts[1]&.include?('D') ? 1 : 0
        d3 = parts[1]&.include?('M') ? 1 : 0
        j1 = parts[3]&.include?('L') ? 1 : 0
        j2 = parts[3]&.include?('E') && !parts[2]&.include?('N') ? 1 : 0
        j3 = parts[3]&.include?('G') ? 1 : 0
        j1, j2, j3 = 1, 1, 1 if parts[3] == 'JMP'
        j1, j2, j3 = 1, 0, 1 if parts[3] == 'JNE'
        @value = "111#{a}#{c}#{d1}#{d2}#{d3}#{j1}#{j2}#{j3}"
      end
    end
  end

  class L_Command
    include Command

    def initialize(text, line_number)
      super text
      @type = :L

      Hack::Command.put_symbol @text, line_number
      @value = Hack::Command.get_symbol @text
    end
  end
end
