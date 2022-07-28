while getopts b:B:s:S:G: flag
do
    case "${flag}" in
        b) brancheSVN=${OPTARG};;
	    B) brancheGIT=${OPTARG};;
        s) svnRepoLink=${OPTARG};;
        S) svnRepoName=${OPTARG};;
        G) repoLink=${OPTARG};;
    esac
done
#diplay message
echo "starting migrate " $svnRepoLink "to" $repoLink

#firstly we clean directry
rm -rf $svnRepoName

#secondly , we clone the specific branche on svn
git svn clone -T $brancheSVN $svnRepoLink

#enter in the sub directory
cd $svnRepoName
echo "|"
echo "|"
echo "|"
echo "|"
#we switch on the specific branche
echo "move to branche : " $brancheGIT
git checkout -b $brancheGIT
echo "|"
echo "|"
echo "|"
echo "|"
#we push the project to the repo
echo "push to "$repoLink
git push $repoLink
echo "|"
echo "|"
echo "|"
echo "|"
echo "FINISHED"
echo "SVN branche : " $brancheSVN
echo " "
echo "svn Repo link : " $svnRepoLink
echo " "
echo "GIT branche : " $brancheGIT
echo " "
echo "Git Repo Link : " $repoLink
echo " "
echo "repoLink : " $repoLink
