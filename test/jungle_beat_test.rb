require "./lib/jungle_beat"
require "./lib/linked_list"

# gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test

  def test_if_new_jb_list_created
   jb = JungleBeat.new
   assert jb
  end

  def test_does_it_append_words
   jb = JungleBeat.new
   jb.append("deep doo ditt")

   assert jb.append("deep doo ditt")
  end

  def test_the_new_count
   jb = JungleBeat.new
   jb.append("deep doo ditt")
   jb.append("woo hoo shu")
   assert_equal 6, jb.count
  end

  def test_to_check_if_plays
   jb = JungleBeat.new
   jb.append("deep doo ditt woo hoo shu")
   assert_equal "", jb.play
  end

end
