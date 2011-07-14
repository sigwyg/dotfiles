#!/usr/bin/sed -f
## MEMO
# [0m  reset
# [1m  bold
# [3m  italic
# [4m  underline
# [5m  blink
# [30m black
# [31m red
# [32m green
# [33m yellow
# [34m blue
# [35m magenta
# [36m cyan
# [37m white
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 \x1b[34m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 \x1b[32m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 \x1b[33m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 \x1b[31m\2\x1b[0m /
## Regex                                                                                                                                      
# s/^.*$/hoge/g
# s/[0-9]\+[^0-9]\?/g
# s/hoge\{n,m\}//g
# s/\(\.cgi\|\.html\)/\1/g
s/\(Warning:\)/\x1b[31m\1\x1b[0m/
s/\(\[error\]\)/\x1b[31m\1\x1b[0m/
s/\(\[warn\]\)/\x1b[31m\1\x1b[0m/
s/\( line [0-9]*\)/\x1b[34m\1\x1b[0m/g
s/\( at \)/\x1b[35m\1\x1b[0m/g
s/\([^ /]*\)\(\.cgi\|\.html\)/\x1b[32m\1\2\x1b[0m/g                                                                                           
s/\([^ /]*\)\(\.ico\|\.p[lm]\)/\x1b[32m\1\2\x1b[0m/g

