#! /bin/bash
#MONGO=/usr/bin/mongo
MONGO=mongo
OPRDB=tr_oprdb_temp
OPRDBHOST=1.62.1.89
OPRDBPORT=27017
OPRDBUSER=user1
OPRDBPWD=123456
OPRDBCMD="$MONGO $OPRDBHOST:$OPRDBPORT/$OPRDB -u $OPRDBUSER -p $OPRDBPWD --eval "
UMDB=tr_umdb_temp
UMDBHOST=1.62.1.89
UMDBPORT=27017
UMDBUSER=user1
UMDBPWD=123456
UMDBCMD="$MONGO $UMDBHOST:$UMDBPORT/$UMDB -u $UMDBUSER -p $UMDBPWD --eval "
echo "cmd start"
$OPRDBCMD 'db.getCollection("property_proposal").find({"mainInfo.unitPremium": {$exists: true}}).snapshot().forEach(item => {item.mainInfo.premium = item.mainInfo.unitPremium;db.property_proposal.replaceOne({_id: item._id}, item)})' &&
	
#$OPRDBCMD 'db.getCollection("agentbroker").update({channelType:"GRQD:个人渠道"},{$set:{channelType:"GRQD"}},{multi: true})' &&
#$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J:综合"},{$set:{agentType:"J"}},{multi: true})' &&
#$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S:寿险"},{$set:{agentType:"S"}},{multi: true})' &&
#$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"Z:其他"},{$set:{agentType:"Z"}},{multi: true})' &&
for cn in agentbroker fin_account_check grade renewal_new
do
$OPRDBCMD 'db.getCollection("'$cn'").update({channelType:"GRQD:个人渠道"},{$set:{channelType:"GRQD"}},{multi: true})' &&
$OPRDBCMD 'db.getCollection("'$cn'").update({agentType:"J:综合"},{$set:{agentType:"J"}},{multi: true})' &&
$OPRDBCMD 'db.getCollection("'$cn'").update({agentType:"S:寿险"},{$set:{agentType:"S"}},{multi: true})' &&
$OPRDBCMD 'db.getCollection("'$cn'").update({agentType:"Z:其他"},{$set:{agentType:"Z"}},{multi: true})'
done
$OPRDBCMD 'db.getCollection("pub_increment_code").remove({_id:/蒙Z/})'&&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentCode:/蒙Z/})' &&
$OPRDBCMD 'db.getCollection("pub_increment_code").remove({_id:/^15Z/})'&&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentCode:/^15Z/})' &&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentStatus:"1"})' &&
$OPRDBCMD 'db.getCollection("jf_agentInfo").remove({saleman:{$in:["15947228544","15149304470", "15540241346", "18686178114","18662157697","13131313130"]}})' &&
$OPRDBCMD 'db.getCollection("jf_agentInfo").remove({salemanCode:{$exists: false}})' &&
$UMDBCMD 'db.getCollection("userinfos").remove({name:{$in:["15947228544","15149304470", "15540241346", "18686178114","18662157697","13131313130"]}})' &&
$UMDBCMD 'db.getCollection("users").remove({name:{$in:["15947228544","15149304470", "15540241346", "18686178114","18662157697","13131313130"]}})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({bankInfo:{$exists: false}},{$set:{bankInfo:{account:"",bankName:""}}},{multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({$or: [{recommCode:""},{recommCode:{$exists: false}}]}, {$set: {recommCode:"", recommName:"",recommPosition: "", recommMobile: ""}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({$or: [{managerCode:""},{managerCode:{$exists: false}}]}, {$set: {managerCode:"", managerName:"",managerPosition: "", managerMobile: ""}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "资深总监"}, {$set: {managerPosition: "6"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "业务总监"}, {$set: {managerPosition: "5"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "资深经理"}, {$set: {managerPosition: "4"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "业务经理"}, {$set: {managerPosition: "3"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "资深顾问"}, {$set: {managerPosition: "2"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",managerPosition: "保险顾问"}, {$set: {managerPosition: "1"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "资深总监"}, {$set: {recommPosition: "6"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "业务总监"}, {$set: {recommPosition: "5"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "资深经理"}, {$set: {recommPosition: "4"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "业务经理"}, {$set: {recommPosition: "3"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "资深顾问"}, {$set: {recommPosition: "2"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "保险顾问"}, {$set: {recommPosition: "1"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"S",recommPosition: "理财顾问"}, {$set: {recommPosition: "1"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",managerPosition: "助理经理"}, {$set: {managerPosition: "7"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",managerPosition: "经理"}, {$set: {managerPosition: "8"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",managerPosition: "高级经理"}, {$set: {managerPosition: "9"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",managerPosition: "总监"}, {$set: {managerPosition: "10"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",managerPosition: "区域总监"}, {$set: {managerPosition: "11"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "区域总监"}, {$set: {recommPosition: "11"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "总监"}, {$set: {recommPosition: "10"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "高级经理"}, {$set: {recommPosition: "9"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "经理"}, {$set: {recommPosition: "8"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "助理经理"}, {$set: {recommPosition: "7"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").update({agentType:"J",recommPosition: "保险顾问"}, {$set: {recommPosition: "7"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("order_info").find({providerCode:"LBCX", policyNo:{$exists: true}}).snapshot().forEach(item => {item.proposalNo = item.policyNo;db.order_info.replaceOne({_id: item._id}, item)})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"ICBC"}, {$set: {"cardInfo.bankName": "工商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"BJCCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"ZJCCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"BJZSB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"BJICBC"}, {$set: {"cardInfo.bankName": "工商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"NJCMB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"ZJICBC"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"WHABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"NJABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"GDCOMM"}, {$set: {"cardInfo.bankName": "交通银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"GDCMB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"GDBOC"}, {$set: {"cardInfo.bankName": "中国银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"CCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("property_proposal").update({providerCode:"TFQQRS", productCode: "TCIB05","cardInfo.bankCode":"ABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"ICBC"}, {$set: {"cardInfo.bankName": "工商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"BJCCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"ZJCCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"BJZSB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"BJICBC"}, {$set: {"cardInfo.bankName": "工商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"NJCMB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"ZJICBC"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"WHABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"NJABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"GDCOMM"}, {$set: {"cardInfo.bankName": "交通银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"GDCMB"}, {$set: {"cardInfo.bankName": "招商银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"GDBOC"}, {$set: {"cardInfo.bankName": "中国银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"CCB"}, {$set: {"cardInfo.bankName": "建设银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({providerCode:"TFQQRS", "cardInfo.bankName":"ABC"}, {$set: {"cardInfo.bankName": "农业银行"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({"beneList.1": {$exists: false },"beneList.0.brelations": {$exists: false}},{$set:{"beneList.0.brelations":"1"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({"beneList.1": {$exists: false },"beneList.0.insuretype": {$exists: false}}, {$set: {"beneList.0.insuretype":"2"}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("contracts").update({"beneList.1": {$exists: false },"beneList.0.percent": {$exists: false}},{$set:{"beneList.0.percent":100}}, {multi: true})' &&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentName:"13618361020",contractMobile:"13618361020"})' &&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentName:"13608328008",contractMobile:"13608328008"})' &&
$OPRDBCMD 'db.getCollection("agentbroker").remove({agentName:"18410511783",contractMobile:"18410511783"})' &&
echo 'cmd end'


