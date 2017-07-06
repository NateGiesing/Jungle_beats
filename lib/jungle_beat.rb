require "./lib/linked_list"

class JungleBeat
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end


  def append(words)
    sound = words.split
    sound.each do |word|
    list.append(word)
    end
  end

  def count
    list.count
  end

  def play
    @rate = 250
    @voice = "Whisper"
    `say -r #{@rate} -v #{@voice} #{list.to_string}`
  end
end
