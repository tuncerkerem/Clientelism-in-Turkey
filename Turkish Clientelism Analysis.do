 clear
use 

**"C:\Users\timfr\Dropbox\WorkPlaceMobilization\Cross-National\Turkey\FinalDataTurkey.dta"
*cd "/Users/john/Dropbox/WorkPlaceMobilization/Cross-National/Turkey"

 
 
 **q1 main occuption***
 
 
 gen noemp = a1
 recode noemp 1=1 2=0 3= 0 4=0 99=.
 
 gen selfemp= a1
 recode selfemp 1=0 2=1 3= 0 4=0 5=0 6=. 99=.
 
 gen privemp= a1
 recode privemp 1=0 2=0 3= 1 4=0 99=.

 gen stateemp = a1

recode stateemp 1=0 2=0 3=0 4=1 99=.

**if not working noemp ==1 ***  
gen unemployed = a2
recode unemployed 2=0 3=0 4=0 5=0 6=0

gen student = a2 
recode student 1=0 2=1 3=0 4=0 5=0 6=0

gen pension = a2
recode pension 1=0 2=0 3=1 4=1 5=0 6=0  
  
 gen housewife = a2
 recode student 1=0 2=0 3=0 4=0 5=1 6=0
 
  **** q3 firmsize **
 gen firmsize = a3
recode firmsize (99=.)

****q5 ***
gen sector = a5
rename sector	firmsector
recode firmsector (18=.)
recode firmsector 99=.

**Note: John investigated on December 10, 2019 and these correspond to provinces as well.  
gen city = il
tab city, gen (citydum)

***"Nuts" are statistica meta-regions.  See here: https://en.wikipedia.org/wiki/NUTS_statistical_regions_of_Turkey
rename Nuts region



tab firmsector, gen(firmsectordum)
rename firmsectordum1 heavyindustry
rename firmsectordum2 lightindustry
rename firmsectordum3 oilgas
rename firmsectordum4 mining
rename firmsectordum5 utilities
rename firmsectordum6 construction
rename firmsectordum7 rtrade
rename firmsectordum8 wtrade
rename firmsectordum9 transportation
rename firmsectordum10 communications
rename firmsectordum11 financial 
rename firmsectordum12 agriculture
rename firmsectordum13 tourism
rename firmsectordum14 impexp
rename firmsectordum15 otherserv
rename firmsectordum16 healthcare
rename firmsectordum17 other
 
gen heavy =1 if heavyindustry ==1 | lightindustry==1 | oilgas==1 | mining==1 | utilities==1 | construction==1
replace heavy=0 if rtrade==1 | wtrade==1| transportation==1 | communications==1 | agriculture==1 | financial==1 | impexp ==1 | tourism ==1 | healthcare ==1 | other==1 | otherserv==1
 
 gen heavy1 =heavy
 replace heavy1=0 if lightindustry==1 | utilities==1 | construction==1
 
 
   
 **** q7 ***
 gen happiness = a7
 recode happiness 99=.

 
 gen followpol = a8
 recode followpol 99 =.
 
 ***what exactly is this quesiton?***
 gen privatesector = a9
recode privatesector 99=.
 
 gen publicsector = a10
 recode publicsector 99=. 

 ***voting ****
 gen novote  = a12
 recode novote 2=0 3= 0 4=0 5=0 6=0 7=0 8=0 9=0 10=0 97=. 98=. 99=.

 gen shyvote = a12
 recode shyvote 1=0 2=0 3= 0 4=0 5=0 6=0 7=0 8=0 9=0 10=0 97=0 98=0 99=1
 gen vote = novote
 recode vote 1=0 0=1
 
 gen akpvote  = a12
 recode akpvote 1=0 2=1 3= 0 4=0 5=0 6=0 7=0 8=0 9=0 10=0 97=. 98=. 99=.

 gen chpvote  = a12
 recode chpvote 1=0 2=0 3= 1 4=0 5=0 6=0 7=0 8=0 9=0 10=0 97=. 98=. 99=.
 
 gen mnpvote  = a12
 recode mnpvote 1=0 2=0 3= 0 4=1 5=0 6=0 7=0 8=0 9=0 10=0 97=. 98=. 99=.
 
 gen hdpvote  = a12
 recode hdpvote 1=0 2=0 3= 0 4=0 5=1 6=0 7=0 8=0 9=0 10=0 97=. 98=. 99=.
  
 
 gen othvote = a12
 recode othvote 1=0 2=0 3=0 4=0 5=1 6=1 7=1 8=1 9=0 97=. 98=. 99=.
 
***q wp mobilization questions for most recent election**
gen wpdiscuss = b1_a
recode wpdiscuss 2=0 97=. 98=. 99=.

gen wpdiscussyou = b1_b
recode wpdiscussyou 2=0 97=. 98=. 99=.

gen wpmaterial = b1_c
recode wpmaterial 2=0 97=. 98=. 99=.

gen wptransport = b1_d
recode wptransport 2=0 97=. 98=. 99=.

gen wpaskvote = b1_e
recode wpaskvote 2=0 97=. 98=. 99=.

gen wpaskcandidate = b1_f
recode wpaskcandidate 2=0 97=. 98 =. 99=.

gen wpaskrally = b1_g
recode wpaskrally 2=0 3=. 4=. 99=.

gen wpgift = b1_h
recode wpgift 2=0 97=. 98=. 99=.

gen wpintimidate = b1_i
recode wpintimidate 2=0  97=. 98=. 99=.

gen anywpmob = 1 if wpdiscuss ==1 | wpdiscussyou ==1 | wpmaterial==1 | wptransport==1 | wpaskrally==1 | wpgift ==1 | wpintimidate ==1 | wpaskvote ==1
replace anywpmob = 0 if wpdiscuss ==0 & wpdiscussyou ==0 & wpmaterial== 0 & wptransport==0 & wpaskrally ==0 & wpgift ==0 & wpintimidate ==0 & wpaskvote ==0

*** wpmob make you more likely to vote ****
gen wplikelytovote = b2_a
recode wplikelytovote 2=0 3=.

gen wplikelytoparty = b2_b
recode wplikelytoparty 2=0 3=. 

gen wpchangemind = b2_c
recode wpchangemind 2=0 3=.



*** party mobilization***
gen partydiscuss = b5_a
recode partydiscuss 2=0 97=. 98=. 99=.

gen partyaskvote = b5_b
recode partyaskvote 2=0 97=. 98=. 99=.

gen partyaskcandidate = b5_c
recode partyaskcandidate 2=0 97=. 98=. 99=.

gen partyaskrally = b5_d
recode partyaskrally 2=0 97=. 98=. 99=.

gen partytransport = b5_e
recode partytransport 2=0 97=. 98=. 99=.

gen partygift = b5_f
recode partygift 2=0 3=. 4=. 99=.
 
gen partyintimidate = b5_g
recode partyintimidate  2=0 97=. 98=. 99=.

gen anypartymob = 1 if partydiscuss ==1 | partyaskvote ==1 | partyaskcandidate==1 | partytransport==1 | partyaskrally==1 | partygift ==1 | partyintimidate ==1 
replace anypartymob = 0 if partydiscuss ==0 & partyaskvote ==0 & partyaskcandidate== 0 & partytransport==0 & partyaskrally ==0 & partygift ==0 & partyintimidate ==0 

**Religious Leader
gen religdiscuss = b6_a
recode religdiscuss 2=0 97=. 98=. 99=.

gen religaskvote = b6_b
recode religaskvote 2=0 97=. 98=. 99=.

gen religaskcandidate = b6_c
recode religaskcandidate 2=0 97=. 98=. 99=.

gen religaskrally = b6_d
recode religaskrally 2=0 97=. 98=. 99=.

gen religtransport = b6_e
recode religtransport 2=0 97=. 98=. 99=.

gen religgift = b6_f
recode religgift 2=0 3=. 4=. 99=.
 
gen religintimidate = b6_g
recode religintimidate  2=0 97=. 98=. 99=.

gen anyreligmob = 1 if religdiscuss ==1 | religaskvote ==1 | religaskcandidate==1 | religtransport==1 | religaskrally==1 | religgift ==1 | religintimidate ==1 
replace anyreligmob = 0 if religdiscuss ==0 & religaskvote ==0 & religaskcandidate== 0 & religtransport==0 & religaskrally ==0 & religgift ==0 & religintimidate ==0



**Association Leader
gen assocdiscuss = b7_a
recode assocdiscuss 2=0 97=. 98=. 99=.

gen assocaskvote = b7_b
recode assocaskvote 2=0 97=. 98=. 99=.

gen assocaskcandidate = b7_c
recode assocaskcandidate 2=0 97=. 98=. 99=.

gen assocaskrally = b7_d
recode assocaskrally 2=0 97=. 98=. 99=.

gen assoctransport = b7_e
recode assoctransport 2=0 97=. 98=. 99=.

gen assocgift = b7_f
recode assocgift 2=0 3=. 4=. 99=.
 
gen associntimidate = b7_g
recode associntimidate  2=0 97=. 98=. 99=.

gen anyassocmob = 1 if assocdiscuss ==1 | assocaskvote ==1 | assocaskcandidate==1 | assoctransport==1 | assocaskrally==1 | assocgift ==1 | associntimidate ==1 
replace anyassocmob = 0 if assocdiscuss ==0 & assocaskvote ==0 & assocaskcandidate== 0 & assoctransport==0 & assocaskrally ==0 & assocgift ==0 & associntimidate ==0




gen comfort = b3
recode comfort 97=. 98=. 99=.

gen acceptaskvote = b4_b
recode acceptaskvote 97=. 98=. 99=.

gen acceptaskcandidate = b4_c
recode acceptaskcandidate 97=. 98=. 99=.

gen acceptmaterial = b4_a
recode acceptmaterial 97=. 98=. 99=.

gen acceptindex = (acceptaskvote +acceptaskcandidate + acceptmaterial)/3

gen male = z1
recode male 2=0

gen educ = z2
recode educ 97=. 98=. 99=.

gen age = z3
recode age 99=.

gen internet = z8
recode internet 2=0 97=. 98=. 99=.

gen income = z15
gen logincome =log(income)




gen english  = z6_1
recode english 2=1 3=0 4=0 99=.

gen arabic = z6_2
recode arabic 2=1 3=0 4=0 99=.

gen kurdish = z6_3
recode kurdish 2=1 3=0 4=0 99=.

gen demsat = z9
recode demsat 5=. 99=.

gen  eusupport = z10
recode eusupport 2=0 3=. 99=.

gen econfamsub = z11
recode econfamsub 6=.  99=.


***determinants of wp mob -- using heavy industry dummmy not stateemp dummy or firmsize due to collinearity ***
***privatesector more likely to be mobilized but state sector only 8 percent of sample *****
**** no partisandimension to wp mob or party mob***
probit  anywpmob educ age loginc male heavy , robust cluster (il)
probit  wpdiscuss educ age loginc male heavy , robust cluster (il)
probit  wpmaterial educ age loginc male heavy , robust cluster (il)
probit  wpaskvote educ age loginc male heavy , robust cluster (il)
probit  wpaskcandidate educ age loginc male heavy , robust cluster (il)
probit  wpaskrally educ age loginc male heavy , robust cluster (il)
probit  wpgift educ age loginc male heavy , robust cluster (il)
probit  wpintimidate educ age loginc male heavy , robust cluster (il) 

*** wp mob with stateemp selfemp privemp

probit  anywpmob educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpdiscuss educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpmaterial educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpaskvote educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpaskcandidate educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpaskrally age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpgift educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  wpintimidate educ age loginc male stateemp selfemp privemp , robust cluster (il)

****party mobilization***
**no partisan dimension ***
probit  anypartymob educ age loginc male heavy , robust cluster (il)
probit  partydiscuss educ age loginc male heavy , robust cluster (il)
probit  partyaskvote educ age loginc male heavy , robust cluster (il)
probit  partyaskcandidate educ age loginc male heavy , robust cluster (il)
probit  partyaskrally educ age loginc male heavy , robust cluster (il)
probit  partygift educ age loginc male heavy , robust cluster (il)
probit  partyintimidate educ age loginc male heavy , robust cluster (il)



**party mob with state employment, self employed and private sector ***
probit  anypartymob educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partydiscuss educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partyaskvote educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partyaskcandidate educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partyaskrally educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partygift educ age loginc male stateemp selfemp privemp , robust cluster (il)
probit  partyintimidate educ age loginc male stateemp selfemp privemp , robust cluster (il)

*** partymobilization using rep sample***

probit  anypartymob educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partydiscuss educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partyaskvote educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partyaskcandidate educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partyaskrally educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partygift educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)
probit  partyintimidate educ age loginc male stateemp selfemp privemp if TUR==1, robust cluster (il)

gen bothmobdv = anypartymob + anywpmob
recode bothmobdv 2=1 1=0


***** acceptable to mobilize workers ***
reg acceptindex educ age loginc male heavy , robust cluster (il)
reg acceptaskvote educ age loginc male heavy, robust cluster (il)
reg acceptaskcandidate educ age loginc male heavy, robust cluster (il)
reg acceptmaterial educ age loginc male heavy, robust cluster (il)

*** acceptable to mobilize including dummy for any mobilization***
** those mobilized see giving materials as ok but not other forms of mobilization****

reg acceptindex anywpmob educ age loginc male heavy , robust cluster (il)

reg acceptaskvote anywpmob educ age loginc male heavy, robust cluster (il)

reg acceptaskcandidate anywpmob educ age loginc male heavy, robust cluster (il)

reg acceptmaterial anywpmob educ age loginc male heavy, robust cluster (il)
 
 
 ***who finds wpmob comfortable ***
 **only 241 observations -- add city dummies for Instanbul and Ankara 
 **similar results clustering on city**
 
reg comfort wpdiscuss educ age loginc male citydum16 citydum2, robust
reg comfort wpdiscussyou educ age loginc male citydum16 citydum2, robust
reg comfort wpmaterial educ age loginc male citydum16 citydum2, robust
reg comfort wptransport educ age loginc male citydum16 citydum2, robust
reg comfort wpaskvote educ age loginc male citydum16 citydum2, robust
reg comfort wpaskcandidate educ age loginc male citydum16 citydum2, robust
reg comfort wpaskrally educ age loginc male citydum16 citydum2, robust
reg comfort wpgift educ age loginc male citydum16 citydum2, robust
reg comfort wpintimidate educ age loginc male citydum16 citydum2, robust



ttest comfort, by (wpdiscuss)
ttest comfort, by (wpdiscussyou)
ttest comfort, by (wpmaterial)
ttest comfort, by (wptransport)
ttest comfort, by (wpaskvote)
ttest comfort, by (wpaskcandidate)
ttest comfort, by (wpaskrally)
ttest comfort, by (wpgift)
ttest comfort, by (wpintimidate)

tab comfort if wpdiscuss ==1
tab comfort if wpdiscussyou ==1
tab comfort if wpmaterial ==1
tab comfort if wptransport ==1
tab comfort if wpaskvote ==1
tab comfort if wpaskcandidate ==1
tab comfort if wpaskrally ==1
tab comfort if wpgift ==1
tab comfort if wpintimidate ==1


reg comfort wpdiscuss educ age loginc male citydum16 citydum2, robust
estimates store wpdiscuss

reg comfort wpdiscussyou educ age loginc male citydum16 citydum2, robust
estimates store wpdiscussyou

reg comfort wpmaterial educ age loginc male citydum16 citydum2, robust
estimates store wpmaterial

reg comfort wptransport educ age loginc male citydum16 citydum2, robust
estimates store wptransport

reg comfort wpaskvote educ age loginc male citydum16 citydum2, robust
estimates store wpaskvote

reg comfort wpaskcandidate educ age loginc male citydum16 citydum2, robust
estimates store wpaskcandidate

reg comfort wpaskrally educ age loginc male citydum16 citydum2, robust
estimates store wpaskrally

reg comfort wpgift educ age loginc male citydum16 citydum2, robust
estimates store wpgift

reg comfort wpintimidate educ age loginc male citydum16 citydum2, robust
estimates store wpintimidate

coefplot wpdiscuss wpdiscussyou wpmaterial wptransport wpaskvote wpaskcandidate wpaskrally wpgift wpintimidate, drop (_cons educ age logincome male citydum16 citydum2) xline (0)


***SDB concerns ***
**shyvoters are those who didn;t answer whether they voted in the last election ***
ttest anypartymob, by (shyvote)
ttest anywpmob, by (shyvote)

ttest partyaskvote, by (shyvote)
ttest wpaskvote, by (shyvote)

ttest partyaskcandidate, by(shyvote)
ttest wpaskcandidate, by (shyvote)


*** underreporting of workplace mobilization by shy respondents
 dprobit  anypartymob shyvote   age loginc male stateemp selfemp citydum1-citydum17, robust
 
dprobit  anywpmob shyvote   age loginc male stateemp selfemp citydum1-citydum17, robust


** list experiment with no2=2 = being asked by employer to vote in the most recent election **
recode c2 99=.

summ c2 if varyant_no2==1 &c2~=99


summ c2 if varyant_no2==2 &c2~=99


*** list experiment with 2 being negative and 3 being positive***
recode c1 99=.

gen control1 =1 if varyant_no1==1 & c1~=.
replace control1 =0 if control1~=1

gen treatneg =1 if varyant_no1==2 & c1~=.
replace treatneg =0 if treatneg~=1

gen treatpos =1 if varyant_no1==3 & c1~=.
replace treatpos =0 if treatpos ~=1

summ c1 if varyant_no1==1 &c1~=99 & anywpmob==1

summ c1 if varyant_no1==2 &c1~=99 & anywpmob==1
summ c1 if varyant_no1==3 &c1~=99 & anywpmob==1

***state versus private and workplace mobilization
summ anywpmob if stateemp==1
summ anywpmob if stateemp==0

***summ state versus private and party mobilization
summ anypartymob if stateemp==1
summ anypartymob if stateemp==1

** positive and negative list experiments subsetting by workplace mobilization

 ttest c1 if anywpmob ==1 &c1~=99 &varyant_no1<3, by (varyant_no1)

ttest c1 if anywpmob ==0 &c1~=99 &varyant_no1<3, by (varyant_no1)


ttest c1 if stateemp ==0 & treatpos==0, by (treatneg)

ttest c1 if stateemp ==1 & treatpos==0, by (treatneg)


ttest c1 if stateemp ==0 & treatneg==0, by (treatpos)
ttest c1 if stateemp ==1 & treatneg==0, by (treatpos)

** positive and negative list experiments subsetting by employed status (20% threat, 4% vote buying)

 ttest c1 if treatpos~=1 & selfemp~=1, by(treatneg)

 ttest c1 if treatneg~=1 & selfemp~=1, by(treatpos)
 
 **
  ttest c1 if treatpos~=1 & selfemp~=1 & anywpmob==1, by(treatneg)

  ttest c1 if treatpos~=1 & selfemp~=1 & anywpmob==0, by(treatneg)



*** party and workplace mob effectiveness experiment **
recode c3 99=.


*** turnout with emplyer [1] ask =1, gift ==2 threat ==3
 summ c3 if varyan_no3==11
 summ c3 if varyan_no3==12
 summ c3 if varyan_no3==13

   *** turnout with party [2] ask =1, gift ==2 threat ==3
 summ c3 if varyan_no3==21
 summ c3 if varyan_no3==22
 summ c3 if  varyan_no3==23

 
 
  summ c3 if akpvote==1 & varyan_no3==11
 summ c3 if akpvote==1 & varyan_no3==12
 summ c3 if akpvote==1 & varyan_no3==13

   *** turnout with party [2] ask =1, gift ==2 threat ==3
 summ c3 if akpvote==1 & varyan_no3==21
 summ c3 if akpvote==1 & varyan_no3==22
 summ c3 if akpvote==1 & varyan_no3==23


 
 
 ***John Playing
 
logit  anywpmob educ age loginc male stateemp i.citydum* , robust 
logit  anywpmob educ age loginc male stateemp firmsize i.citydum* , robust 
logit  anywpmob educ age loginc male stateemp firmsize heavy i.citydum* , robust
*rtrade reference 
logit  anywpmob educ age loginc male stateemp firmsize heavyindustry lightindustry oilgas mining utilities construction  wtrade transportation communications financial agriculture tourism impexp otherserv healthcare other i.citydum* , robust 

tab anywpmob a5_kod, col

logit  wpaskvote educ age loginc male stateemp i.citydum* , robust 
logit  wpaskvote educ age loginc male stateemp firmsize i.citydum* , robust 
logit  wpaskvote educ age loginc male stateemp firmsize heavy i.citydum* , robust
*rtrade reference 
logit  wpaskvote educ age loginc male stateemp firmsize heavyindustry lightindustry oilgas mining utilities construction  wtrade transportation communications financial agriculture tourism impexp otherserv healthcare other i.citydum* , robust 

tab wpaskvote a5_kod, col


***Effectiveness

logit vote anywpmob educ age loginc male stateemp firmsize heavy i.citydum* , robust
logit vote wpaskvote educ age loginc male stateemp firmsize heavy i.citydum* , robust



 ***Table 1 in Chapter 2
tab noemp if selfemp~=1
**These are pre-filtered for employed only
tab wpdiscuss if  selfemp~=1 
tab wpdiscussyou if selfemp~=1
tab wpmaterial  if selfemp~=1 
tab wptransport  if selfemp~=1 
tab wpaskvote  if selfemp~=1
tab wpaskrally if selfemp~=1 
tab wpaskcandidate  if selfemp~=1 
tab anywpmob  if selfemp~=1 




 ***Table 3 in Chapter 2 (Main Option)
 tab anypartymob
 tab anyreligmob
 tab anyassocmob
 tab anywpmob if selfemp!=1
 *Share of wpmob in total sample
 di 244/1508
 
 
 
 
  ***Table 3 in Chapter 2 (Alt Option)
 gen party_tab3=1 if partyaskvote==1 | partyaskcandidate==1 | partygift==1 | partyintimidate==1
replace party_tab3=0 if partyaskvote==0 & partyaskcandidate==0 & partygift==0 & partyintimidate==0

gen wp_tab3=1 if wpaskcandidate==1 | wpaskvote==1 | wpgift ==1 | wpintimidate ==1
replace wp_tab3=0 if wpaskcandidate==0 & wpaskvote==0 & wpgift ==0 & wpintimidate ==0

 gen relig_tab3=1 if religaskvote==1 | religaskcandidate==1 | religgift==1 | religintimidate==1
replace relig_tab3=0 if religaskvote==0 & religaskcandidate==0 & religgift==0 & religintimidate==0

gen assoc_tab3=1 if assocaskcandidate==1 | assocaskvote==1 | assocgift ==1 | associntimidate ==1
replace assoc_tab3=0 if assocaskcandidate==0 & assocaskvote==0 & assocgift ==0 & associntimidate ==0


tab party_tab3
tab wp_tab3 if selfemp!=1
count
 *Share of wpmob in total sample
di 71/1508
tab relig_tab3
tab assoc_tab3




***Table 4
** positive and negative list experiments subsetting by employed status (20% threat, 4% vote buying)

 ttest c1 if treatpos~=1 & selfemp~=1, by(treatneg)

 ttest c1 if treatneg~=1 & selfemp~=1, by(treatpos)
 
 *Table 8 Private vs Public
tab anywpmob stateemp  if selfemp~=1, col


ttest acceptaskcandidate, by (akpvote)

ttest acceptaskvote, by (akpvote)

ttest acceptmaterial, by (akpvote)

ttest acceptindex, by (akpvote)


tab acceptaskcandidate if akpvote ==1
tab acceptaskcandidate if akpvote ==0

tab acceptaskvote if akpvote ==1
tab acceptaskvote if akpvote ==0

tab acceptmaterial if akpvote ==1
tab acceptmaterial if akpvote ==0



