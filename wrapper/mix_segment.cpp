#include "MixSegment.hpp"

using namespace CppJieba;
MixSegment segment;

extern "C"{
  bool init_c(const char * dict_path, const char * model_path)
  {
    return segment.init(dict_path, model_path);
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