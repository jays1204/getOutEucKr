#!/usr/bin/env bash

#argument declaration
repositoryPath=$1
excludeFileType=$2

#help message
function echoHelp {
  if [ "$repositoryPath" == "--help" ];
  then
    echo "{directory path to change encoding scheme} : specify absolute directory path to change encoding scheme."
  fi
}

function runTest {
  if [ "$repositoryPath" == "runTest" ];
    then 
      checkEssentiallibrary
      convertCharacterEncoding "runTest"
  fi
}

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
    echo ""
  else
    if [ "$repositoryPath" != "--help" ];
    then
      echo "$repositoryPath is not directory or not exist."
    fi
    exit -1
  fi
}

function isFileInDirectory {
  fileCount=$(ls $repositoryPath | wc -l)

  if [ $fileCount =< 1 ];
  then
    echo "No file In $repositoryPath"
    echo "File Count is $fileCount"
    exit -1
  fi
}

function validArgument {
  checkEssentiallibrary
  checkValidDirectory
  isFileInDirectory
}

function backupOriginal {
  tar cvf $HOME/convertBak.tar $repositoryPath
  
  echo "original backup tar file is craeted on $HOME/convertBak.tar"
}

function convertCharacterEncoding () {
  if [ "$1" == "runTest" ];
    then
      targetPath=$(pwd)
    else
      backupOriginal
      targetPath=$1
  fi
  
  fileList=`find $targetPath -name \*.* -printf "%h/%f\n"`:
  
  for filePath in $fileList
  do
    encodingScheme=$(file -bi $filePath | cut -d '=' -f2)

    if [ "$encodingScheme" == "iso-8859-1" ];
    then
      echo "fileName : $filePath , encSchem : $encodingScheme" >> ./result.txt
      iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp
      mv $filePath.tmp $filePath
    fi
  done
}

#check validation of arguments
echoHelp
runTest
validArgument

# announce target direcotry 
echo "$repositoryPath directory is targeted on change character encoding"

convertCharacterEncoding $repositoryPath
