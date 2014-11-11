CPPJIEBA_PATH=../ext/libcppjieba/include

CFLAGS=-g -fPIC -O3
CPPJIEBA_FLAGS=-I$(CPPJIEBA_PATH)
CC?=clang
CXX?=clang++

ifeq ($(shell uname),Darwin)
	OPTIONS=-dynamiclib -undefined dynamic_lookup -std=c++11
else
	OPTIONS=-lstdc++
endif

mix_segment.so:
	$(CXX) $(CFLAGS) $(CPPJIEBA_FLAGS) -shared $(OPTIONS) -DLOGGER_LEVEL=LL_ERROR mix_segment.cpp -o $@ 2>&1
clean:
	rm *.so
	rm -r *.so.*