#!/bin/bash

# both operations have the same precedence and are left associative
true || echo aaa && echo bbb # prints 'bbb'
# is different from 
true || (echo aaa && echo bbb) # prints nothing