require_relative 'robot'
require_relative 'table'
require_relative 'action'
require_relative 'turn'
require_relative 'position'
require_relative '../lib/errors/position_error'
require_relative '../lib/errors/placed_error'

direction = "WEST"
table = Table.new # new table with default 5x5
@robot = Robot.new(direction: direction, table: table) # create robot with false placed status
@row = 3 # update with placed position
@column = 7
@direction = "NORTH"
@robot.place(row: @row, column: @column, direction: @direction) # placed = true
@robot.report(@row, @column, @direction) # print first report
@action = Action.new(@robot) # create new action

@action.move # move
@robot.report(@robot.row, @robot.column, @robot.direction) # print new position


# @table = Table.new
# @robot = Robot.new(row: 5, column: 5, direction: "NORTH", table: @table)
# @action = Action.new(@robot)

# puts @action.move
