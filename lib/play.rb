require_relative 'robot'
require_relative 'table'
require_relative 'action'
require_relative 'turn'
require_relative 'position'
require_relative '../lib/error/position_error'
require_relative '../lib/error/placed_error'

test1 = File.open("test/test_1.txt")
test2 = File.open("test/test_2.txt")
test3 = File.open("test/test_3.txt")
test4 = File.open("test/test_4.txt")
test5 = File.open("test/test_5.txt")

test_files = [test1, test2, test3, test4, test5]

test_files.each do |file|
  begin
    @table = Table.new
    @robot = Robot.new(table: @table)
    commands = file.readlines.map(&:chomp)

    commands.each do |command|
      case
      when
        command.include?("PLACE")
        @position = command.scan(/\d/)[0, 2]
        @robot.row = @position[0].to_i
        @robot.column = @position[1].to_i
        @robot.direction = command.match(/\A\D.........(.*)/)[1]
        @robot.place(row: @robot.row, column: @robot.column, direction: @robot.direction)
      when
        command.include?("MOVE")
        action = Action.new(@robot)
        action.move
      when
        command.include?("LEFT")
        turn = Turn.new(@robot)
        turn.turn_left(@robot.direction)
      when
        command.include?("RIGHT")
        turn = Turn.new(@robot)
        turn.turn_right(@robot.direction)
      when
        command.include?("REPORT")
        puts @robot.report(@robot.row, @robot.column, @robot.direction)
      end
    end
  rescue StandardError => e
    puts "Try again, #{e.message.downcase}."
  end
end
