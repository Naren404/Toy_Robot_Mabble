class Robot
    attr_reader :x_position, :y_position, :facing, :min_x_range, :max_x_range, :min_y_range, :max_y_range

    def initialize(x_coordinate,y_coordinate,face, min_x_range, max_x_range, min_y_range, max_y_range)
      @x_position = x_coordinate
      @y_position = y_coordinate
      @facing = face
      @min_x_range = min_x_range
      @max_x_range = max_x_range
      @min_y_range = min_y_range
      @max_y_range = max_y_range
    end

    def move 
      case facing
      when "EAST"
        @x_position = @x_position.to_i + 1
      when "WEST"
        @x_position = @x_position.to_i - 1
      when "NORTH"
        @y_position = @y_position.to_i + 1
      when "SOUTH"
        @y_position = @y_position.to_i - 1 
      end
      will_fall?
    end

    def left
      case facing
      when "EAST"
        @facing = "NORTH"
      when "WEST"
        @facing = "SOUTH"
      when "NORTH"
        @facing = "WEST"
      when "SOUTH"
        @facing = "EAST"
      end   
    end

    def right 
      case facing
      when "EAST"
        @facing = "SOUTH"
      when "WEST"
        @facing = "NORTH"
      when "NORTH"
        @facing = "EAST"
      when "SOUTH"
        @facing = "WEST"
      end
    end
    
    def place(new_x_coordinate, new_y_coordinate, new_facing)
      @x_position = new_x_coordinate
      @y_position = new_y_coordinate
      @facing = new_facing
      will_fall?
    end

    def report
      report = "Report: #{x_position},#{y_position},#{facing}"
      puts report
    end

    def will_fall?
        if x_position.to_i < min_x_range || x_position.to_i > max_x_range || y_position.to_i < min_y_range || y_position.to_i > max_y_range
          puts "ALERT!! The robot will fall from table in this move."
          abort
        end
    end
end
