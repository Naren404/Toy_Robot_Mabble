class Table
    attr_reader :x_coordinates_range, :y_coordinates_range

    def initialize(x_coordinates_range,y_coordinates_range)
        @x_coordinates_range = x_coordinates_range
        @y_coordinates_range = y_coordinates_range
    end
end
