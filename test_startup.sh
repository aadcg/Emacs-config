#!/bin/bash

echo "Attempting startup..."

emacs26 -nw --batch --eval '(load-file "~/.emacs.d/init.el")'

echo "Startup successful!"
