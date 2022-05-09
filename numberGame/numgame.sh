#!/bin/bash
randomNumber=$(( $RANDOM % 10 ))
loopBreak=false;
count=0

checkNumber(){
  if [ $reciveNumber -gt $randomNumber ] ; then
    echo "${reciveNumber} is bigger than answer."
  elif [ $reciveNumber -lt $randomNumber ] ; then
    echo "${reciveNumber} is smaller than answer."
  elif [ $reciveNumber -eq $randomNumber ] ; then
    echo "Your count $count"
    echo "Correct!"
    loopBreak=true
  fi
}

while true
do
  read -p "Enter the number : " reciveNumber
  expr $reciveNumber + 1 > /dev/null 2>&1
  errorCode=$?
  if [ $errorCode -ge 2 ] ; then
    echo "Enter a number!"
  else
    count=`expr $count + 1`
    checkNumber
    if $loopBreak ; then
      break
    fi
  fi
done