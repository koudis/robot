#!/bin/sh

MY_NAME="$0"
DIE=0
LOG_DIR="/mnt/logs/"
EXECUTABLE=""

if [ "$#" -lt "1" ]; then
  echo "Usage: $MY_NAME [-h|--help] [-l <log-directory>] <program>"
  exit 1
fi
while [ "$#" -gt "0" ]; do
  case $1 in
    -h)
      echo "Usage: $MY_NAME [-h|--help] [-l <log-directory>] <program>"
      exit 0
      ;;
    --help)
      echo "Usage: $MY_NAME [-h|--help] [-l <log-directory>] <program>"
      exit 0
      ;;
    -l)
      shift
      LOG_DIR=$1
      ;;
    *)
      EXECUTABLE="$1"
      ;;
  esac
  shift
done
if [ -z "$EXECUTABLE" ]; then
  echo "Usage: $MY_NAME [-h|--help] [-l <log-directory>] <program>"
  exit 1
fi


if [ ! -d "$LOG_DIR" ]; then
  echo "$MY_NAME: $LOG_DIR: Not a directory" >&2
  DIE=1
fi
if [ ! -x "$EXECUTABLE" ]; then
  echo "$MY_NAME: $EXECUTABLE: Permission denied" >&2
  DIE=1
fi
if [ "$DIE" -eq "1" ]; then
  exit 1
fi

FILE="log_"
NUM=`cat "$LOG_DIR/aktual" 2> /dev/null`
NUM=`expr "$NUM" "|" "0"`
NUM=`expr "$NUM" "+" "1"`
echo $NUM > "$LOG_DIR/aktual"

LOG_FILE="$LOG_DIR/$FILE$NUM"

PWD_DIR=`pwd`

echo "LOG_FILE=$LOG_FILE"
echo "LOG_FILE=$LOG_FILE" > "$LOG_FILE"
echo "LOG_DIR=$LOG_DIR"
echo "LOG_DIR=$LOG_DIR" >> "$LOG_FILE"
echo "EXECUTABLE=$EXECUTABLE"
echo "EXECUTABLE=$EXECUTABLE" >> "$LOG_FILE"
echo "PWD_DIR=$PWD_DIR"
echo "PWD_DIR=$PWD_DIR" >> "$LOG_FILE"
date "+%s" >> "$LOG_FILE"
echo "+--------------- Program start ------------------+" >> "$LOG_FILE"

"$EXECUTABLE" 2>&1 | tee -a "$LOG_FILE"

echo "+---------------- Program end -------------------+" >> "$LOG_FILE"
date "+%s" >> "$LOG_FILE"
sync


