#!/usr/bin/env bash

repositoryPath=$1

echo $repositoryPath
# Check Validation
if [ "$repositoryPath" == "" ];
then
  echo "Input correct path"
  exit -1
fi


# get List of repository files
javaList=`find $repositoryPath -name \*.java -printf "%h/%f\n"`
xmlList=`find $repositoryPath -name \*.xml -printf "%h/%f\n"`
sqlList=`find $repositoryPath -name \*.sql -printf "%h/%f\n"`
propertiesList=`find $repositoryPath -name \*.properties -printf "%h/%f\n"`

if [ "$javaList" == "" ];
then
  echo "No *.java file"
else
  for i in $javaList:
  do
    filePath=${i/.java\:/.java}
    iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp && mv $filePath.tmp $filePath
    echo $filePath
  done
fi

if [ "$xmlList" == "" ];
then
  echo "*.xml file not exist"
else
  for i in $xmlList:
  do
    filePath=${i/.xml\:/.xml}
    kccResult=`kcc -c $filePath`
    
    iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp && mv $filePath.tmp $filePath
    echo $filePath
  done
fi

if [ "$sqlList" == "" ];
then
  echo "*.sql file not exist"
else
  for i in $sqlList:
  do
    filePath=${i/.sql\:/.sql}
    iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp && mv $filePath.tmp $filePath
    echo $filePath
  done
fi

if [ "$propertiesList" == "" ];
then
  echo "*.properties file not exist"
else
  for i in $propertiesList:
  do
    filePath=${i/.properties\:/.properties}
    iconv -c -f euc-kr -t utf-8 $filePath > $filePath.tmp && mv $filePath.tmp $filePath
    echo $filePath
  done
fi
