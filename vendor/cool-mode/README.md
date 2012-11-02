Emacs mode for COOL 
-------------------

This is a emacs major mode for the COOL language used in the Coursera
compiler course. This course is a public version of Stanford CS143.
The indentation is highly opinionated.

It is based on an answer from stack overflow
[http://stackoverflow.com/questions/9425466/emacs-mode-for-a-c-like-language](here)

The code is heavily borrowed from the following:

1. [http://gosu-lang.org/downloads/gosu-mode.el](Gosu Mode)
2. [http://go.googlecode.com/hg/misc/emacs/go-mode.el](Go lang mode)

Issues
------
1. The indentation expects a coding and commenting convention 
   to work properly. Please see test.cl for an example.
2. Nested comments doesn't work
3. Escaped character strings might screw up
4. Accepts other strings with ' or ` delimiter
5. Very strange behaviour with "if" and "else" indentation, 
   especially when there is "if" or "else" in a comment or 
   a string above.
6. Tested only on emacs 23.3 on Ubuntu 12.04
7. ... and many more!!!
