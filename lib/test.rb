require_relative 'app'

class Test

  file = File.open("test/position.txt")

  test_file = file.readlines.map(&:chomp)

# puts test_file

def run_place
  test_file.each do |command|
    if command.include?("PLACE")
      @position = command.scan(/\d/)[0,2]
      end
              @position.each do |x|
            puts @position
          end
    end
  end

end



