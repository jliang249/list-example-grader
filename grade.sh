# Create your grading script here

rm -rf student-submission
git clone --quiet $1 student-submission
# echo 'Finished cloning'

cp TestListExamples.java student-submission
cp ParseOutput.java student-submission
cd student-submission

if[[!(-e ListExamples.java)]]{
    echo "No ListeExamples.java found! Wrong file name!"
    exit 1
}

fi

javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar.java

if[[!($? == 0)]]{
    echo "File failed to compile"
    exit 1
}

fi

java ParseOutput $(java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples)

echo "Score was $?" 



