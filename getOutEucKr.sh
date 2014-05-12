#!/usr/bin/env bash

#argument declaration
repositoryPath=$1
excludeFileType=$2

#validation function
function checkEssentiallibrary {
  existIconv=$(which iconv | wc -l)

  if [ "$existIconv" == "" ];
  then
    echo "Please Install iconv!"
    exit -1
  fi
}

function checkValidDirectory {
  if [ "$repositoryPath" == "" ];
  then
    echo "Input correct path"
    exit -1
  fi

  if [ -d $repositoryPath ];
  then
    
  else
    echo "$repositoryPath is not directory or not exist."
    exit -1
  fi
}

function isFileInDirectory {
  fileCount=$(ls | wc -l)
  if [ $fileCount =< 1 ];
  then
    echo "No file In $repositoryPath"
    exit -1
  fi
}

function validArgument {
  checkEssentiallibrary()
  checkValidDirectory()
  isFileInDirectory()
}

function translateCharacterEncoding {
  for filePath in "$repositoryPath"/*
  do
    iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp
    mv $filePath.tmp $filePath
  done
}

#check validation of arguments
validArgument()

# announce target direcotry 
echo "$repositoryPath directory is targeted on change character encoding"

translateCharacterEncoding()
