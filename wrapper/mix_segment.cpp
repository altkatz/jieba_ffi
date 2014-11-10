#include "MixSegment.hpp"

using namespace CppJieba;
const char * const dict_path =  "../libcppjieba/dict/jieba.dict.utf8";
const char * const model_path = "../libcppjieba/dict/hmm_model.utf8";
MixSegment segment;

extern "C"{
  void init()
  {
    segment.init(dict_path, model_path);
  }

  int cut_c(const char* text, char **&result)
  {
    vector<string> words;
    segment.cut(text, words);
    int word_count = words.size();
    result = (char**)(malloc(sizeof(char*)*word_count));
    int i = 0;
    for (vector<string>::const_iterator j = words.begin(); j != words.end(); j++)
    {
      result[i++] = strdup((*j).c_str());
    }
    return word_count;
  }

  void free_c(int word_count, char **&result)
  {
    for (int i = 0; i < word_count; ++i)
    {
      free(result[i++]);
    }
    free(result);
  }
}