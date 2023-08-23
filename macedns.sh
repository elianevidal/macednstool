  #!/bin/bash
  #Mace Vidal script to get A records null/nil
  
  find $1 -type f  -name "db.*" -exec awk '!/^;/ {if($3=="A" && $4=="" || $4=="A" && $5=="") print $0}' {} \;
