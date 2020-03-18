#!/bin/sh
ROOT_PATH=$PWD
rm list_folder.txt
find $ROOT_PATH -type d > list_folder.txt
# insert path end
PATH_BEGIN="{\"path\":\""
#sed -i s/$/$PATH_BEGIN/ list_folder.txt
PATH_END="\/\"},"
#sed -i s/$/$PATH_END/ list_folder.txt
#{"path":"/home/wall/projects/templates/Makefile/Makefile_generic/Make-gcc/src"},
sed -i s/^/$PATH_BEGIN/ list_folder.txt | sed -i s/$/$PATH_END/ list_folder.txt
