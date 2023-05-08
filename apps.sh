

#!/bin/sh

data=`curl -s https://raw.githubusercontent.com/intelliriffer/MOCKBA-ADDONS-DEPOT/master/APPLIST.csv`
if [ $? -ne 0 ]; then
	echo "Unable to download Apps List - Exiting.."
	exit 0;
fi

FETCH() {
id=`echo "$1" | cut -d'|' -f1`
url=`echo "$1" | cut -d'|' -f2`
echo "Downloadding [$id] from: $url"
}





ifs=IFS

IFS='
';
echo "#####################################################"
echo "              MOCKBA MOD ADDONS REPO                 "
echo -e "#####################################################\n"
apps=()
ids=()
for line in $data;
do
    apps=(${apps[@]} "$line")
    id=`echo "$line" | cut -d'|' -f1`
    ids=(${ids[@]} "$id")
done;

cnt=0
for uid in "${ids[@]}"; 
do
    cnt=$((cnt+1))	
    echo "$cnt). $uid"
done

IFS=$ifs

opt=-1;
while (( $opt < 0 )) || (($opt > $cnt));do
    echo -e "#####################################################\n"

    echo "please enter an Option 1-$cnt" , '0 to cancel'
    read -p "Option: " opt
done;

if [ $opt -ne 0 ]; then
    opt=$(($opt-1));
    echo "You Chose " ${apps[$opt]};
    FETCH  "${apps[$opt]};"
fi




# tokens=$(PARSE "amit|good|boy");
# echo $tokens;