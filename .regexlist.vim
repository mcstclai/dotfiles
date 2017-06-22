
let typedef_struct = 'typedef struct \({\_.\{-}}\)\(.*\);'
let rm_typedef = '%s/typedef struct \({\_.\{-}}\)\(.*\);/struct\2 \1;/g'
let camel_to_us = '%s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g'
