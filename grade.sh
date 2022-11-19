# Create your grading script here

set -e
rm -rf student-submission
git clone $1 student-submission

CP = ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

#check if file exist 
if[[ -f "./student-submission/ListExamples.java"]]
then 
    echo "Right file submitted!"

else 
    echo "Wrong file submitted!"

fi 

cp TestListExamples.java ./student-submission/
cp -r lib ./student-submission/
cp ParseOutput.java ./student-submission/
set +e 

cd student-submission
javac -cp $CP *.java
java -cp $CP org.junt.runner.JUnitCore TestListExamples 

if [[!($? == 0)]]
then 
    echo "File failed to compile"
    exit 

fi

java ParseOutput $(java $CP org.junit.runner.JUnitCore TestListExamples)
echo "Score was $?"


