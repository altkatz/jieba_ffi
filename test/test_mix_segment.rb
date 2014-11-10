require 'minitest/autorun'
require 'jieba'
class JiebaTest < Minitest::Test
  def test_mix_segment
    Jieba::MixSegment.init
    words = Jieba::MixSegment.cut "我来到南京市长江大桥"
    assert_equal %w(我 来到 南京市 长江大桥), words
    words = Jieba::MixSegment.cut "我有一只小毛驴可我从来都不骑"
    assert_equal %w(我 有 一只 小毛驴 可 我 从来 都 不 骑), words
  end
end
