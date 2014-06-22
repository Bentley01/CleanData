## 


##  Set working directory
## If running this script on a different computer, please place data files in your current working directory
## and change the following line to reflect your current working directory

setwd("C:/Rprogramming/Project/UCI HAR Dataset/CleanData")

## View list of project files

filelist <- list.files(recursive=F)
filelist

# [1] "activity_labels.txt" "CodeBook.md"         "features.txt"        "features_info.txt"   "README.md"          
# [6] "README.txt"          "run_analysis.R"      "subject_test.txt"    "subject_train.txt"   "test"               
# [11] "train"               "X_test.txt"          "X_train.txt"         "y_test.txt"          "y_train.txt"              

Xtrain <- read.table("X_train.txt")
dim(Xtrain)
# [1] 7352  561

names(Xtrain)
# [1] "V1"   "V2"   "V3"   "V4"   "V5"   "V6"   "V7"   "V8"   "V9"   "V10"  "V11"  "V12"  "V13"  "V14"  "V15" 
# [16] "V16"  "V17"  "V18"  "V19"  "V20"  "V21"  "V22"  "V23"  "V24"  "V25"  "V26"  "V27"  "V28"  "V29"  "V30" 
# [31] "V31"  "V32"  "V33"  "V34"  "V35"  "V36"  "V37"  "V38"  "V39"  "V40"  "V41"  "V42"  "V43"  "V44"  "V45" 
# [46] "V46"  "V47"  "V48"  "V49"  "V50"  "V51"  "V52"  "V53"  "V54"  "V55"  "V56"  "V57"  "V58"  "V59"  "V60" 
# [61] "V61"  "V62"  "V63"  "V64"  "V65"  "V66"  "V67"  "V68"  "V69"  "V70"  "V71"  "V72"  "V73"  "V74"  "V75" 
# [76] "V76"  "V77"  "V78"  "V79"  "V80"  "V81"  "V82"  "V83"  "V84"  "V85"  "V86"  "V87"  "V88"  "V89"  "V90" 
# [91] "V91"  "V92"  "V93"  "V94"  "V95"  "V96"  "V97"  "V98"  "V99"  "V100" "V101" "V102" "V103" "V104" "V105"
# [106] "V106" "V107" "V108" "V109" "V110" "V111" "V112" "V113" "V114" "V115" "V116" "V117" "V118" "V119" "V120"
# [121] "V121" "V122" "V123" "V124" "V125" "V126" "V127" "V128" "V129" "V130" "V131" "V132" "V133" "V134" "V135"
# [136] "V136" "V137" "V138" "V139" "V140" "V141" "V142" "V143" "V144" "V145" "V146" "V147" "V148" "V149" "V150"
# [151] "V151" "V152" "V153" "V154" "V155" "V156" "V157" "V158" "V159" "V160" "V161" "V162" "V163" "V164" "V165"
# [166] "V166" "V167" "V168" "V169" "V170" "V171" "V172" "V173" "V174" "V175" "V176" "V177" "V178" "V179" "V180"
# [181] "V181" "V182" "V183" "V184" "V185" "V186" "V187" "V188" "V189" "V190" "V191" "V192" "V193" "V194" "V195"
# [196] "V196" "V197" "V198" "V199" "V200" "V201" "V202" "V203" "V204" "V205" "V206" "V207" "V208" "V209" "V210"
# [211] "V211" "V212" "V213" "V214" "V215" "V216" "V217" "V218" "V219" "V220" "V221" "V222" "V223" "V224" "V225"
# [226] "V226" "V227" "V228" "V229" "V230" "V231" "V232" "V233" "V234" "V235" "V236" "V237" "V238" "V239" "V240"
# [241] "V241" "V242" "V243" "V244" "V245" "V246" "V247" "V248" "V249" "V250" "V251" "V252" "V253" "V254" "V255"
# [256] "V256" "V257" "V258" "V259" "V260" "V261" "V262" "V263" "V264" "V265" "V266" "V267" "V268" "V269" "V270"
# [271] "V271" "V272" "V273" "V274" "V275" "V276" "V277" "V278" "V279" "V280" "V281" "V282" "V283" "V284" "V285"
# [286] "V286" "V287" "V288" "V289" "V290" "V291" "V292" "V293" "V294" "V295" "V296" "V297" "V298" "V299" "V300"
# [301] "V301" "V302" "V303" "V304" "V305" "V306" "V307" "V308" "V309" "V310" "V311" "V312" "V313" "V314" "V315"
# [316] "V316" "V317" "V318" "V319" "V320" "V321" "V322" "V323" "V324" "V325" "V326" "V327" "V328" "V329" "V330"
# [331] "V331" "V332" "V333" "V334" "V335" "V336" "V337" "V338" "V339" "V340" "V341" "V342" "V343" "V344" "V345"
# [346] "V346" "V347" "V348" "V349" "V350" "V351" "V352" "V353" "V354" "V355" "V356" "V357" "V358" "V359" "V360"
# [361] "V361" "V362" "V363" "V364" "V365" "V366" "V367" "V368" "V369" "V370" "V371" "V372" "V373" "V374" "V375"
# [376] "V376" "V377" "V378" "V379" "V380" "V381" "V382" "V383" "V384" "V385" "V386" "V387" "V388" "V389" "V390"
# [391] "V391" "V392" "V393" "V394" "V395" "V396" "V397" "V398" "V399" "V400" "V401" "V402" "V403" "V404" "V405"
# [406] "V406" "V407" "V408" "V409" "V410" "V411" "V412" "V413" "V414" "V415" "V416" "V417" "V418" "V419" "V420"
# [421] "V421" "V422" "V423" "V424" "V425" "V426" "V427" "V428" "V429" "V430" "V431" "V432" "V433" "V434" "V435"
# [436] "V436" "V437" "V438" "V439" "V440" "V441" "V442" "V443" "V444" "V445" "V446" "V447" "V448" "V449" "V450"
# [451] "V451" "V452" "V453" "V454" "V455" "V456" "V457" "V458" "V459" "V460" "V461" "V462" "V463" "V464" "V465"
# [466] "V466" "V467" "V468" "V469" "V470" "V471" "V472" "V473" "V474" "V475" "V476" "V477" "V478" "V479" "V480"
# [481] "V481" "V482" "V483" "V484" "V485" "V486" "V487" "V488" "V489" "V490" "V491" "V492" "V493" "V494" "V495"
# [496] "V496" "V497" "V498" "V499" "V500" "V501" "V502" "V503" "V504" "V505" "V506" "V507" "V508" "V509" "V510"
# [511] "V511" "V512" "V513" "V514" "V515" "V516" "V517" "V518" "V519" "V520" "V521" "V522" "V523" "V524" "V525"
# [526] "V526" "V527" "V528" "V529" "V530" "V531" "V532" "V533" "V534" "V535" "V536" "V537" "V538" "V539" "V540"
# [541] "V541" "V542" "V543" "V544" "V545" "V546" "V547" "V548" "V549" "V550" "V551" "V552" "V553" "V554" "V555"
# [556] "V556" "V557" "V558" "V559" "V560" "V561"


## Obtain subject number for each row of data from y_train.txt
subjecttrain <- read.table("subject_train.txt")
dim(subjecttrain)
# [1] 7352    1

## Obtain outcome value for each line
ytrain <- read.table("y_train.txt")
dim(ytrain)
# [1] 7352    1

## combine Xtrain, subjecttrain, and ytrain for training set data
training <- cbind(Xtrain, subjecttrain, ytrain)
dim(training)
# [1] 7352  563


## do the same for the test set

Xtest <- read.table("X_test.txt")
dim(Xtest)
# [1] 2947  561

subjecttest <- read.table("subject_test.txt")
dim(subjecttest)
# [1] 2947    1

ytest <- read.table("y_test.txt")
dim(ytest)
# [1] 2947    1

test <- cbind(Xtest, subjecttest, ytest)

dim(test)
# [1] 2947  563

## Use rbind to append rows of test onto training

dataset <- rbind(test, training)
dim(dataset)
# [1] 10299   563


## Get feature (variable) names from features.txt
## Use read.table to get data.frame with feature # (V1) and feature description (V2)
## recast description as character from factor

features <- read.table("features.txt")
features$V2 <- as.character(features$V2)

## Add feature variable names to dataset

varnames <- features$V2
varnames <- c(varnames, "Subject", "Activity")
colnames(dataset) <- varnames


## Make dataframe easier to deal with - shorten column names & dataframe name

## Note there are 84 duplicate feature names. 14 features with names starting with fBody Acc, fBody AccJerk, and fBody Gyro
##  Each of these features has 3 identical names.
##  Reviewed the data (values) in the duplicate features and noted that they were NOT identical
##  Therefore, decided to create a unique identifier for each feature variable
##  Since there are 561 variables, it is difficult to keep track where each one is in the data.frame
##  Decided to add "v." followed by the column number (1:561), followed by "." and the initial feature name

names(dataset) <- c(paste('v', 1:561, ".", names(dataset[1:561]), sep=''), 'subject', 'activity')
##  Removed all "-" and replaced with "." for easier readability
names(dataset) <- gsub("-", ".", names(dataset))
##  Removed "()" for easier readability
names(dataset) <- gsub("\\()", "", names(dataset))


## Subset data.frame keeping only features that measure mean and std(deviation), plus Subject and Activity

cleanedData <- dataset[,c(grep("\\.(mean|std)(\\.[X|Y|Z])?$", names(dataset)), 562, 563)]

## Make activity and subject factor variables, to enable analyses by activity or subject
cleanedData$activity <- as.factor(cleanedData$activity)
cleanedData$subject <- as.factor(cleanedData$subject)

## Check to see if there are any missing values, if returns 0, no missing values

sum(is.na(cleanedData))
# [1] 0

## Get activity labels -> create data.frame with V1 = activity #, V2 = activity description

labels <- read.table("activity_labels.txt")

## Replace activity codes with names of activities (i.e. 2 >- "STANDING")
cleanedData$activity <- labels$V2[cleanedData$activity]

## Obtain the means of the columns for every combination of subject and activity

datameans <- aggregate(cleanedData[,1:66], list(Subject = cleanedData$subject, Activity = cleanedData$activity), mean)
datameans$Activity <- labels$V2[datameans$Activity]

dim(datameans)
# [1] 180  68


str(datameans)
# 'data.frame':    180 obs. of  68 variables:
#     $ Subject                       : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
# $ Activity                      : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
# $ v1.tBodyAcc.mean.X            : num  0.277 0.276 0.276 0.279 0.278 ...
# $ v2.tBodyAcc.mean.Y            : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
# $ v3.tBodyAcc.mean.Z            : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...
# $ v4.tBodyAcc.std.X             : num  -0.284 -0.424 -0.36 -0.441 -0.294 ...
# $ v5.tBodyAcc.std.Y             : num  0.1145 -0.0781 -0.0699 -0.0788 0.0767 ...
# $ v6.tBodyAcc.std.Z             : num  -0.26 -0.425 -0.387 -0.586 -0.457 ...
# $ v41.tGravityAcc.mean.X        : num  0.935 0.913 0.937 0.964 0.973 ...
# $ v42.tGravityAcc.mean.Y        : num  -0.2822 -0.3466 -0.262 -0.0859 -0.1004 ...
# $ v43.tGravityAcc.mean.Z        : num  -0.0681 0.08473 -0.13811 0.12776 0.00248 ...
# $ v44.tGravityAcc.std.X         : num  -0.977 -0.973 -0.978 -0.984 -0.979 ...
# $ v45.tGravityAcc.std.Y         : num  -0.971 -0.972 -0.962 -0.968 -0.962 ...
# $ v46.tGravityAcc.std.Z         : num  -0.948 -0.972 -0.952 -0.963 -0.965 ...
# $ v81.tBodyAccJerk.mean.X       : num  0.074 0.0618 0.0815 0.0784 0.0846 ...
# $ v82.tBodyAccJerk.mean.Y       : num  0.02827 0.01825 0.01006 0.00296 -0.01632 ...
# $ v83.tBodyAccJerk.mean.Z       : num  -4.17e-03 7.90e-03 -5.62e-03 -7.68e-04 8.32e-05 ...
# $ v84.tBodyAccJerk.std.X        : num  -0.114 -0.278 -0.269 -0.297 -0.303 ...
# $ v85.tBodyAccJerk.std.Y        : num  0.067 -0.0166 -0.045 -0.2212 -0.091 ...
# $ v86.tBodyAccJerk.std.Z        : num  -0.503 -0.586 -0.529 -0.751 -0.613 ...
# $ v121.tBodyGyro.mean.X         : num  -0.0418 -0.053 -0.0256 -0.0318 -0.0489 ...
# $ v122.tBodyGyro.mean.Y         : num  -0.0695 -0.0482 -0.0779 -0.0727 -0.069 ...
# $ v123.tBodyGyro.mean.Z         : num  0.0849 0.0828 0.0813 0.0806 0.0815 ...
# $ v124.tBodyGyro.std.X          : num  -0.474 -0.562 -0.572 -0.501 -0.491 ...
# $ v125.tBodyGyro.std.Y          : num  -0.0546 -0.5385 -0.5638 -0.6654 -0.5046 ...
# $ v126.tBodyGyro.std.Z          : num  -0.344 -0.481 -0.477 -0.663 -0.319 ...
# $ v161.tBodyGyroJerk.mean.X     : num  -0.09 -0.0819 -0.0952 -0.1153 -0.0888 ...
# $ v162.tBodyGyroJerk.mean.Y     : num  -0.0398 -0.0538 -0.0388 -0.0393 -0.045 ...
# $ v163.tBodyGyroJerk.mean.Z     : num  -0.0461 -0.0515 -0.0504 -0.0551 -0.0483 ...
# $ v164.tBodyGyroJerk.std.X      : num  -0.207 -0.39 -0.386 -0.492 -0.358 ...
# $ v165.tBodyGyroJerk.std.Y      : num  -0.304 -0.634 -0.639 -0.807 -0.571 ...
# $ v166.tBodyGyroJerk.std.Z      : num  -0.404 -0.435 -0.537 -0.64 -0.158 ...
# $ v201.tBodyAccMag.mean         : num  -0.137 -0.29 -0.255 -0.312 -0.158 ...
# $ v202.tBodyAccMag.std          : num  -0.22 -0.423 -0.328 -0.528 -0.377 ...
# $ v214.tGravityAccMag.mean      : num  -0.137 -0.29 -0.255 -0.312 -0.158 ...
# $ v215.tGravityAccMag.std       : num  -0.22 -0.423 -0.328 -0.528 -0.377 ...
# $ v227.tBodyAccJerkMag.mean     : num  -0.141 -0.281 -0.28 -0.367 -0.288 ...
# $ v228.tBodyAccJerkMag.std      : num  -0.0745 -0.1642 -0.1399 -0.3169 -0.2822 ...
# $ v240.tBodyGyroMag.mean        : num  -0.161 -0.447 -0.466 -0.498 -0.356 ...
# $ v241.tBodyGyroMag.std         : num  -0.187 -0.553 -0.562 -0.553 -0.492 ...
# $ v253.tBodyGyroJerkMag.mean    : num  -0.299 -0.548 -0.566 -0.681 -0.445 ...
# $ v254.tBodyGyroJerkMag.std     : num  -0.325 -0.558 -0.567 -0.73 -0.489 ...
# $ v266.fBodyAcc.mean.X          : num  -0.203 -0.346 -0.317 -0.427 -0.288 ...
# $ v267.fBodyAcc.mean.Y          : num  0.08971 -0.0219 -0.0813 -0.1494 0.00946 ...
# $ v268.fBodyAcc.mean.Z          : num  -0.332 -0.454 -0.412 -0.631 -0.49 ...
# $ v269.fBodyAcc.std.X           : num  -0.319 -0.458 -0.379 -0.447 -0.298 ...
# $ v270.fBodyAcc.std.Y           : num  0.056 -0.1692 -0.124 -0.1018 0.0426 ...
# $ v271.fBodyAcc.std.Z           : num  -0.28 -0.455 -0.423 -0.594 -0.483 ...
# $ v345.fBodyAccJerk.mean.X      : num  -0.171 -0.305 -0.305 -0.359 -0.345 ...
# $ v346.fBodyAccJerk.mean.Y      : num  -0.0352 -0.0788 -0.1405 -0.2796 -0.1811 ...
# $ v347.fBodyAccJerk.mean.Z      : num  -0.469 -0.555 -0.514 -0.729 -0.59 ...
# $ v348.fBodyAccJerk.std.X       : num  -0.134 -0.314 -0.297 -0.297 -0.321 ...
# $ v349.fBodyAccJerk.std.Y       : num  0.10674 -0.01533 -0.00561 -0.2099 -0.05452 ...
# $ v350.fBodyAccJerk.std.Z       : num  -0.535 -0.616 -0.544 -0.772 -0.633 ...
# $ v424.fBodyGyro.mean.X         : num  -0.339 -0.43 -0.438 -0.373 -0.373 ...
# $ v425.fBodyGyro.mean.Y         : num  -0.103 -0.555 -0.562 -0.688 -0.514 ...
# $ v426.fBodyGyro.mean.Z         : num  -0.256 -0.397 -0.418 -0.601 -0.213 ...
# $ v427.fBodyGyro.std.X          : num  -0.517 -0.604 -0.615 -0.543 -0.529 ...
# $ v428.fBodyGyro.std.Y          : num  -0.0335 -0.533 -0.5689 -0.6547 -0.5027 ...
# $ v429.fBodyGyro.std.Z          : num  -0.437 -0.56 -0.546 -0.716 -0.42 ...
# $ v503.fBodyAccMag.mean         : num  -0.129 -0.324 -0.29 -0.451 -0.305 ...
# $ v504.fBodyAccMag.std          : num  -0.398 -0.577 -0.456 -0.651 -0.52 ...
# $ v516.fBodyBodyAccJerkMag.mean : num  -0.0571 -0.1691 -0.1868 -0.3186 -0.2695 ...
# $ v517.fBodyBodyAccJerkMag.std  : num  -0.1035 -0.1641 -0.0899 -0.3205 -0.3057 ...
# $ v529.fBodyBodyGyroMag.mean    : num  -0.199 -0.531 -0.57 -0.609 -0.484 ...
# $ v530.fBodyBodyGyroMag.std     : num  -0.321 -0.652 -0.633 -0.594 -0.59 ...
# $ v542.fBodyBodyGyroJerkMag.mean: num  -0.319 -0.583 -0.608 -0.724 -0.548 ...
# $ v543.fBodyBodyGyroJerkMag.std : num  -0.382 -0.558 -0.549 -0.758 -0.456 ...



## Sample lines from datameans (first 6 columns)
## Tested a sample of entries, by subsetting datameans on Subject and Activity and calculating column means
datameans[c(1,31,61,91,121,151),1:6]
# Subject           Activity v1.tBodyAcc.mean.X v2.tBodyAcc.mean.Y v3.tBodyAcc.mean.Z v4.tBodyAcc.std.X
# 1         1            WALKING          0.2773308       -0.017383819         -0.1111481       -0.28374026
# 32        2   WALKING_UPSTAIRS          0.2471648       -0.021412113         -0.1525139       -0.30437641
# 63        3 WALKING_DOWNSTAIRS          0.2924235       -0.019355408         -0.1161398       -0.05741005
# 94        4            SITTING          0.2715383       -0.007163065         -0.1058746       -0.98030993
# 125       5           STANDING          0.2825444       -0.007004186         -0.1021711       -0.96859182
# 156       6             LAYING          0.2486565       -0.010252917         -0.1331196       -0.93404942


## Write file to disk

write.table(datameans, file = "datameans.txt", row.names = F)
