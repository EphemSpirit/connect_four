class Player

  attr_accessor :marker

  def get_marker
    puts "Red (R) or Black (B)?"
    self.marker = gets.chomp.upcase
    if marker != "R" && marker != "B"
      puts "Pick one of the two, R or B."
      get_marker
    end
    return marker
  end

end
