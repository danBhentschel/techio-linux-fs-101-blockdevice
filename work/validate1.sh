# { autofold
#!/bin/bash

function checkFileExists {
  FILE=$1
  FINISHED=0
  while [ $FINISHED -eq 0 ]; do
    if [ -e "$FILE" ]
    then
      echo "CG> success true"
      FINISHED=1
    fi
    sleep 0.1
  done 
}

checkFileExists "/foo/bar/valid_file"
# }
