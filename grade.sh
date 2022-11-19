# Create your grading script here

set -e
rm -rf student-submission
git clone $1 student-submission

#check if file exist 
if [-e ListExamples.java]
    then 
        echo "Right file submitted!"

    else 
        echo "Wrong file submitted!"
fi 

cp TestListExamples.java student-submission
cp ParseOutput.java student-submission
cd student submission 

CP = ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

javac -cp $CP *.java
java -cp $CP org.junt.runner.JUnitCore TestListExamples 

if [[!($? == 0)]]
    then 
        echo "File failed to compile"
        exit 
fi

echo "Score was $?"


