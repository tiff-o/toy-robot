class Robot
  # DIRECTIONS %w[ NORTH EAST SOUTH WEST ]
  attr_accessor :row, :column, :direction, :table

  def initialize(row=0, column=0, direction, table)
    # create robot with origin(0,0) position
    @row = row
    @column = column
    @direction = direction
    @table = table
  end

  def place(row, column, direction)
    # place if on table
    if @table.on_table?(row, column)
    # set current position
      @row = row
      @column = column
      @direction = direction
    else
      raise "position not on table"
    end
  end

  def report(row, column, direction)
    # REPORT - announces X,Y & F of robot
    @position = "#{row}, #{column}, #{direction}"
  end
end

  # # def placed?(row, column)
  # #   row.between?(0,5) && column.between?(0,5) ? @placed : false


    # cannot take command if no valid place position
    # place must be first command
    # place can be called again
  # end

  # def on_table?(row, column)
  #   #position not valid if not within 5x5 dimensions
  #   #command ignored if not valid
  #   row.between?(0,5) && column.between?(0,5) ? @placed : @placed = false
  # end

  # def can_move?(row, column, direction)

  # end



@robot = Robot.new(direction: "NORTH")
puts @robot.place(4, 4, "NORTH")




