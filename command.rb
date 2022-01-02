require './robot.rb'
require './table.rb'

if ARGV[0] != "PLACE"
    puts "Invalid COMMAND"
    return
end
  
  x_coordinate = ARGV[1].split(",")[0]
  y_coordinate = ARGV[1].split(",")[1]
  facing = ARGV[1].split(",")[2]

  table = Table.new((0..5).to_a,(0..5).to_a)

  min_x_range = table.x_coordinates_range[0]
  max_x_range = table.x_coordinates_range[4]
  min_y_range = table.y_coordinates_range[0]
  max_y_range = table.y_coordinates_range[4]

  robot = Robot.new(x_coordinate, y_coordinate, facing,min_x_range, max_x_range,min_y_range, max_y_range)

  commands = ARGV.slice(2,ARGV.size)

    commands.each_with_index do |command, index|
        case command
        when "MOVE"
            robot.move
        when "LEFT"
            robot.left
        when "RIGHT"
            robot.right
        when "PLACE"
            new_x_coordinate = commands[index + 1].split(",")[0]
            new_y_coordinate = commands[index + 1].split(",")[1]
            new_facing = commands[index + 1].split(",")[2]

            robot.place(new_x_coordinate, new_y_coordinate,new_facing)
            next
        when "REPORT"
            puts robot.report
        end
    end
  
  


