class Board

    attr_reader :max_height

    def self.build_stacks(number)
        array = Array.new(number) {Array.new()}
    end

    def initialize(stacks, height)
        raise "rows and cols must be >= 4" if height < 4 || stacks < 4
        @max_height = height
        @stacks = Board.build_stacks(stacks)
    end

    def add(token, stack_index)
        return false if stack_index > @max_height
        return false if @stacks[stack_index].length == @max_height
        @stacks[stack_index] << token
        true
    end

    def vertical_winner?(token)
        check = @stacks.select {|subarr| subarr.length == @max_height}
        check.any? {|subarr| subarr.all?{|ele| ele == token}}
    end

    def horizontal_winner?(token)
        check = Marshal.load(Marshal.dump(@stacks))

            
        check.each do |subarr|
            while subarr.length != @max_height
                subarr << "?"
            end
        end
        check = check.transpose()
        check.any? {|subarr| subarr.all?{|ele| ele == token}}
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
