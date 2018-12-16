# PSL DEV MAVEN OTMM REPO

##Publishing new OTMM jars to the Repo

### Pull Repo

- Make a local copy of the Maven Repo (e.g. ~/Dev/psl-repo)
- Copy the JARS that needs to be published to Repo
- Copy to a new dir (e.g ~/Dev/otmm-XX-jars)

###Generate POMS for JAR files
**Make the Maven folders locally from JAR files**

Replace **XX** below with the version of the OTMM (e.g. 16, 105, 731 etc)

	> export RUN_TYPE=install
	> cd ~/Dev/psl-repo
	> ./mvn-install-jars.sh com.otmm.XX XX ~/otmm-xx-jars/*.jar


###Update ALL-JARS for the new JAR files
**Show the XML**

	> export RUN_TYPE=print
	> cd ~/Dev/psl-repo
	> ./mvn-install-jars.sh com.otmm.XX XX ~/otmm-xx-jars/*.jar

#### Create all-jars 
You can either create an **all-jars** pom or copy a previous version. Be sure to update the various XML files as needed.

#### Copy all the dependencies into all-jars pom		
		<project>
			<modelVersion>4.0.0</modelVersion>
		    <groupId>com.otmm.731</groupId>
		    <artifactId>all-jars</artifactId>
		    <version>7.31</version>
		    <packaging>pom</packaging>
		    <dependencies>
		    	-------> [ENTER DEP HERE]
		    </dependencies>
		</project>

##Commit and Push to the PSL Maven Repo
Remember to push the changes to JARS and POM to the PSL Maven Repo

1. GIT command line
2. Using SourceTree/Other Git clients


	