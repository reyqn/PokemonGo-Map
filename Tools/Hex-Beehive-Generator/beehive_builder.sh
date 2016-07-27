cd Tools/Hex-Beehive-Generator/
python2 location_generator.py -st $1 -lp $2 -lat $3 -lon $4 > locations.txt
echo "" > beehive.sh
while read line || [[ -n "$line" ]]; do
	echo "nohup python2 runserver.py -ns -l '$line' -st $1 -td 60 &" >> beehive.sh
done < locations.txt
echo "nohup python2 runserver.py -os -l '$3, $4' &" >> beehive.sh
chmod u+x beehive.sh
echo "Beehive generated. Run ./beehive.sh to unleash the swarm."
