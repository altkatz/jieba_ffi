require 'ffi'

module Jieba
  module MixSegment
    extend FFI::Library
    DEFAULT_DICT_PATH = Jieba::EXT_BASE + "dict/jieba.dict.utf8"
    DEFAULT_MODEL_PATH =  Jieba::EXT_BASE + "dict/hmm_model.utf8"

    def self.init dict_path = DEFAULT_DICT_PATH, model_path = DEFAULT_MODEL_PATH
      init_c dict_path, model_path
    end

    def self.cut sentence
      ptr2ptr = FFI::MemoryPointer.new(:pointer)
      word_count = cut_c(sentence, ptr2ptr)
      ptr = ptr2ptr.read_pointer
      words = ptr.get_array_of_string(0, word_count)
      free_c(word_count, ptr2ptr)
      words.each do |word|
        word.force_encoding('UTF-8')
      end
    end

    private
    ffi_lib Jieba::WRAPPER_BASE+"mix_segment.so"
    attach_function :init_c, [:string, :string], :bool
    attach_function :cut_c, [:string, :pointer], :int
    attach_function :free_c, [:int, :pointer], :void
  end
end