#!/bin/bash

echo "Attempting startup..."

emacs -nw --batch --eval '(load-file "~/.emacs.d/init.el")'

echo "Startup successful!"
