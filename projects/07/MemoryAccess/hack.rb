module Hack
  module Command
    class << self
      attr_accessor :current_vm_file

      def parse(text)
        parts = text.split(/\s+/)
        clazz = get_class parts[0].capitalize
        raise "Unknown command #{parts[0]}" if clazz.nil?

        return clazz.new if parts.size == 1
        return clazz.new parts[1], parts[2] if parts.size == 3

        raise "Illegal command  #{parts[0]}"
      end

      private

      def get_class(class_name)
        return const_get class_name if const_defined? class_name

        nil
      end
    end
    class BaseCommand
      attr_accessor :text, :line_number
    end
    class BinaryCommand < BaseCommand
    end
    class UnaryCommand < BaseCommand
    end

    class MemeryAccessCommand < BaseCommand
      attr_accessor :segment, :index

      def initialize(segment, index)
        @segment = segment
        @index = index
      end

      def get_segment(seg)
        case seg
        when 'argument'
          'ARG'
        when 'local'
          'LCL'
        when 'this'
          'THIS'
        when 'that'
          'THAT'
        when 'pointer'
          'THIS'
        when 'temp'
          'R5'
        else
          raise "Unknown segment #{seg}"
        end
      end
    end

    class Add < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        M=D+M
        @SP
        AM=M-1
        A=A-1
        ASM
      end
    end

    class Sub < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        M=M-D
        @SP
        AM=M-1
        A=A-1
        ASM
      end
    end

    class Eq < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        D=M-D
        @TRUE#{line_number}
        D;JEQ
        @SP
        AM=M-1
        A=A-1
        M=0
        @END#{line_number}
        0;JMP
        (TRUE#{line_number})
        @SP
        AM=M-1
        A=A-1
        M=-1
        (END#{line_number})
        @SP
        A=M
        A=A-1
        ASM
      end

    end

    class Gt < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        D=M-D
        @TRUE#{line_number}
        D;JGT
        @SP
        AM=M-1
        A=A-1
        M=0
        @END#{line_number}
        0;JMP
        (TRUE#{line_number})
        @SP
        AM=M-1
        A=A-1
        M=-1
        (END#{line_number})
        @SP
        A=M
        A=A-1
        ASM
      end
    end
    class Lt < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        D=M-D
        @TRUE#{line_number}
        D;JLT
        @SP
        AM=M-1
        A=A-1
        M=0
        @END#{line_number}
        0;JMP
        (TRUE#{line_number})
        @SP
        AM=M-1
        A=A-1
        M=-1
        (END#{line_number})
        @SP
        A=M
        A=A-1
        ASM
      end
    end

    class And < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        M=D&M
        @SP
        AM=M-1
        A=A-1
        ASM
      end
    end

    class Or < BinaryCommand
      def compile
        <<-ASM
        D=M
        A=A-1
        M=D|M
        @SP
        AM=M-1
        A=A-1
        ASM
      end
    end

    class Neg < UnaryCommand
      def compile
        <<-ASM
        M=-M
        ASM
      end
    end

    class Not < UnaryCommand
      def compile
        <<-ASM
        M=!M
        ASM
      end
    end

    class Pop < MemeryAccessCommand
      def compile
        if @segment == 'static'
          return <<-ASM
          D=M
          @#{current_vm_file}.#{index}
          M=D
          @SP
          AM=M-1
          A=A-1
          ASM
        end
        <<-ASM
        @#{index}
        D=A
        @#{get_segment(@segment)}
        D=D+A
        @R5
        M=D
        @SP
        A=M
        AM=A-1
        D=M
        @R5
        A=M
        M=D
        @SP
        A=M-1
        ASM
      end
    end

    class Push < MemeryAccessCommand
      def compile
        if @segment == 'static'
          return <<-ASM
          @#{current_vm_file}.#{index}
          D=M
          @SP
          A=M
          M=D
          @SP
          AM=M+1
          A=A-1
          ASM
        end

        if @segment == 'constant'
          return <<-ASM
          @#{index}
          D=A
          @SP
          A=M
          M=D
          @SP
          AM=M+1
          A=A-1
          ASM
        end

        <<-ASM
        @#{index}
        D=A
        @#{get_segment(@segment)}
        A=M
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        AM=M+1
        A=A-1
        ASM
      end
    end
  end

end
