require "./tables"
require "test/unit"

class TestTable < Test::Unit::TestCase
    def test_table
        title = "My Title"
        content = ["first", "second", "third"]
        table = Table.new(title, content)
        assert_equal(title, table.title)
        assert_equal(content, table.contents)
    end
end
