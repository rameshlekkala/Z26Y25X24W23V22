# Capture command arguments and options
GROUP=$1
shift
VERSION=$1
shift
FILES="$@"
if [[ "$GROUP" == "" || "$VERSION" == "" || "$FILES" == "" ]]; then
 printf "ERROR: invalid arguments: GROUP VERSION FILES...\n"
 exit 1
fi

RUN_TYPE=${RUN_TYPE:="print"} # values: print|install|deploy
REPO_ID=${REPO_ID:="nexus-server"} # Id defined in user's settings.xml for authentication
REPO_URL=${REPO_URL:="https://github.com/psldev/A21B22C23D24E25/raw/master/"}

# For each file, perform action based on run type.
for FILE in $FILES; do
 ARTIFACT=`basename $FILE '.jar'`
 if [[ "$RUN_TYPE" == "deploy" ]]; then
  printf "Deploying file=$FILE as artifact=$ARTIFACT to repo=$REPO_URL\n"
  mvn deploy:deploy-file \
   -DrepositoryId=$REPO_ID -Durl=$REPO_URL \
   -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION -Dpackaging=jar \
   -Dfile=$FILE
 elif [[ "$RUN_TYPE" == "install" ]]; then
  printf "Installing file=$FILE as artifact=$ARTIFACT\n"
  mvn install:install-file \
   -DgroupId=$GROUP -DartifactId=$ARTIFACT -Dversion=$VERSION -Dpackaging=jar \
   -Dfile=$FILE -DlocalRepositoryPath=.
 elif [[ "$RUN_TYPE" == "print" ]]; then
  printf "        <dependency>\n"
  printf "            <groupId>$GROUP</groupId>\n"
  printf "            <artifactId>$ARTIFACT</artifactId>\n"
  printf "            <version>$VERSION</version>\n"
  printf "        </dependency>\n"
 fi
done