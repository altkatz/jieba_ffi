require "jieba/version"

module Jieba
  LIB_BASE = "#{::File.dirname(__FILE__)}/../"
  EXT_BASE = LIB_BASE + "ext/libcppjieba/"
  WRAPPER_BASE = LIB_BASE + "wrapper/"
  require 'jieba/mix_segment'
end
