MONGOEXPORT=/usr/bin/mongoexport
MONGOIMPORT=/usr/bin/mongoimport
DBFROMHOST=1.62.1.89 # from host
DBFROMPORT=27017 # from port
DBFROMUSER=user1 # from user
DBFROMPWD=123456 # from password
DBFROMDATABASE=tr_oprdb # from DB

DBTOHOST=1.62.1.89 # to host
DBTOPORT=27017 # to port
DBTOUSER=user1 # to user
DBTOPWD=123456 # to password
DBTODATABASE=tr_oprdb_temp # to database
EXPORTPRE="$MONGOEXPORT -h $DBFROMHOST:$DBFROMPORT -u $DBFROMUSER -p $DBFROMPWD -d $DBFROMDATABASE"
IMPORTPRE="$MONGOIMPORT -h $DBTOHOST:$DBTOPORT -u $DBTOUSER -p $DBTOPWD -d $DBTODATABASE"
$EXPORTPRE -c base_channel -o base_channel.bson && $IMPORTPRE -c base_channel base_channel.bson
$EXPORTPRE -c position -o position.bson && $IMPORTPRE -c position position.bson
rm -f *.bson
# echo $IMPORTPRE


