%module hello_ext

%{
#include "hello.h"
%}

%include "hello.h"
