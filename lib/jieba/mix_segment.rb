require 'ffi'

module Jieba
  module MixSegment
    extend FFI::Library
    ffi_lib "#{::File.dirname(__FILE__)}/../../wrapper/mix_segment.so"
    attach_function :init, [], :void
    attach_function :cut_c, [:string, :pointer], :int
    attach_function :free_c, [:int, :pointer], :void

    def self.cut sentence
      ptr2ptr = FFI::MemoryPointer.new(:pointer)
      word_count = self.cut_c(sentence, ptr2ptr)
      ptr = ptr2ptr.read_pointer
      words = ptr.get_array_of_string(0, word_count)
      free_c(word_count, ptr2ptr)
      words.each do |word|
        word.force_encoding('UTF-8')
      end
    end
  end
end