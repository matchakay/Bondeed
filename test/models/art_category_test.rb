require 'test_helper'

class ArtCategoryTest < ActiveSupport::TestCase

  test "ArtCategory save" do
    ArtCategory = ArtCategory.new ({
        id: 1,
        name: "金製品",
    })
    assert ArtCategory.save, 'Succeeded to save'
  end
end
