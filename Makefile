CXX			 = g++

PYTHON		 = python3

PYTHON_HOME	 = /usr
PYTHON_VER	 = 3.9

INCDIR		 = -I$(PYTHON_HOME)/include/python$(PYTHON_VER)
# INCDIR	 = -I$(shell find /usr -name Python.h)

CXXFLAGS	 = -fPIC -shared

all: run

build: _hello_ext.so

hello_wrap.cc: hello.i
	swig -c++ -python -cppext cc $^

_hello_ext.so: hello_wrap.cc hello.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@ $(INCDIR)

run: _hello_ext.so
	$(PYTHON) main.py

clean:
	rm -rf __pycache__
	rm -rf hello_wrap.cc _hello_ext.so hello_ext.py
