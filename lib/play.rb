require_relative 'robot'
require_relative 'table'
require_relative 'action'


test1 = File.open("test/test_1.txt")
test2 = File.open("test/test_2.txt")
test3 = File.open("test/test_3.txt")
test4 = File.open("test/test_4.txt")
test5 = File.open("test/test_5.txt")
test6 = File.open("test/test_6.txt")

test_files = [test1, test2, test3, test4, test5, test6]

test_files.each do |file|
    puts "#{File.basename(file, ".txt")}"
    table = Table.new
    robot = Robot.new(table: table)
    commands = file.readlines.map(&:chomp)
    begin
    commands.each do |command|
      case
      when command.start_with?("PLACE")
        begin
        matches = command.match(/\w+ (\d+),(\d+),(\w+)/)
        row = matches[1].to_i
        column = matches[2].to_i
        direction = matches[3]
        robot.place(row: row, column: column, direction: direction)
        rescue Robot::PositionError => e
          puts "Try again, chosen place #{e.message.downcase}"
          if robot.placed?
            "Try again, #{e.message.downcase}"
          end
        end
      when command.start_with?("MOVE")
        Action.move(robot)
      when command.start_with?("LEFT")
        Action.turn_left(robot)
      when command.start_with?("RIGHT")
        Action.turn_right(robot)
      when command.start_with?("REPORT")
        puts "Your robot's current position is #{Action.report(robot)}"
      end
      rescue StandardError => e
      puts "Try again, #{e.message.downcase}"
    end
  end
  puts "------------------------------------------------"
end
