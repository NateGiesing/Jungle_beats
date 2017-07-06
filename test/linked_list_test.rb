require "minitest/autorun"
require "minitest/pride"
require "./lib/linked_list"

class LinkedListTest < Minitest::Test

  def test_head_is_nil
    list = LinkedList.new
    assert_nil list.head
  end

  def test_adds_a_node
    list     = LinkedList.new
    list.append("doop")
    expected = "doop"
    actual   = list.head.data

    assert_equal expected, actual
  end

  def test_append_set_head_to_new_node
    list = LinkedList.new
    list.append("doop")
    expected = Node
    actual   = list.head.class

    assert_equal expected, actual
  end

  def test_next_node_equal_nil_when_one_node_exist
    list = LinkedList.new
    list.append("doop")

    assert_nil list.head.next_node
  end

  def test_next_node_creates_an_object
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expected = Node
    actual   = list.head.next_node.class

    assert_equal expected, actual
    assert_equal "deep", list.head.next_node.data
  end

  def test_list_can_count
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expected = 2
    actual   = list.count

    assert_equal expected, actual
  end

  def test_list_can_turn_into_a_string
    list = LinkedList.new
    list.append("doop")
    list.append("deep")
    expected = "doop deep"
    actual   = list.to_string

    assert_equal expected, actual
  end

  def test_prepending_will_output_data
    list = LinkedList.new

    assert_equal "dop", list.prepend("dop")
  end

  def test_prepending_add_string_to_front
    # skip
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expected = "dop plop suu"
    actual   = list.to_string

    assert_equal expected, actual
  end

  def test_prepending_creates_node_at_the_front
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expected = "dop"
    actual   = list.head.data

    assert_equal expected, actual
  end

  def test_prepending_creates_node_at_the_front_and_doesnt_destroy_old_nodes
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expected =  "plop"
    actual   = list.head.next_node.data

    assert_equal expected, actual
  end

  def test_prepending_doesnt_ruin_count
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    expected = 3
    actual   = list.count

    assert_equal expected, actual
  end

  def test_it_inserts_data
   list = LinkedList.new
   list.append("plop")
   list.append("suu")
   list.prepend("dop")
   list.insert(1, "woo")
   expected = "dop woo plop suu"
   actual   = list.to_string

   assert_equal expected, actual
   end

 def test_list_of_strings
   # skip
   list = LinkedList.new
   list.append("deep")
   list.append("woo")
   list.append("shi")
   list.append("shu")
   list.append("blop")
   expected = "deep woo shi shu blop"
   actual   = list.to_string

   assert_equal expected, actual
 end

 def test_it_can_find
   list = LinkedList.new
   list.append("deep")
   list.append("woo")
   list.append("shi")
   list.append("shu")
   list.append("blop")

   expected = "shi"
   actual   = list.find(2,1)

   assert_equal expected, actual
   assert_equal "woo shi shu", list.find(1,3)
 end

 def test_check_if_deep_is_included
  list = LinkedList.new
  list.append("deep")
  list.append("woo")
  list.append("shi")
  list.append("shu")
  list.append("blop")

  assert_equal true, list.includes?("deep")
 end

  def test_check_if_dep_is_included
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal false, list.includes?("dep")
  end

  def test_pop_removes_last
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "blop", list.pop
    assert_equal "shu", list.pop
    assert_equal "deep woo shi" , list.to_string
  end
end
