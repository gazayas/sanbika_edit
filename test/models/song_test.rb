require 'test_helper'

class SongTest < ActiveSupport::TestCase

  test "fixtures"  do
    song = Song.first
    assert song.valid?
  end

end
