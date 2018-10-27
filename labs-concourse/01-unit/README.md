# 01 Unit Test

This lab will build on what we just learned by executing a real build on the Spring Music application in this repository.  In addition to building the project we'll see that we can also run unit tests and potentially fail the job if something isn't working as expected.

## Review the pipeline.yml

As before we have a single resource for watching this git repository.  However, you should have immediately noticed something different.  The `((username))` in the uri.  In Concourse this is called a Parameter and these can be used in any value of the pipeline.  Parameters are very useful in makine jobs that can be reused in different contexts.  Typically, these paramaters will be registered with Concourse in a different way so the actual values can be managed external to the pipeline itself.

In this case the username should refer to your GitHub repository username.  This way we can use the same pipeline.yml but replace the parameter for each student.

## Jobs

Like the hello-world example, we have one single job but this one refers to a unit-test yml file.  Review both the `unit-test.yml` and `unit-test.sh` script.  What is different about this job and why? 

## Task 'inputs'

Tasks can have both inputs and outputs.  In the unit-test task, we have a single input that comes from the "get" step in the unit-test job.  In this case it makes the code from the git repository available for the task to operate on.

## Task 'run'

A task run can actually execute any binary or script made available to it via the inputs.  For the unit-test job, this will run the unit-test.sh bash script using the openjdk container.  The unit-test.sh script just invokes the gradlew (wrapper) script that knows hows to build the project and run its test.

## Fly

Lets run this pipeline and see what happens:

```
fly -t main set-pipeline -p spring-music -c pipeline.yml -v username=<your username>
```

This time we will supply the required Parameter value through the `-v` command line option, notice how the value shows up in the summary before you apply the configuration.  This is good way to verfiy that you're value is set exactly the way you expect before proceeding.

Next, unpause the pipeline and wait...

This time you should notice that the unit-test job triggers on its own.  Sometimes you need to be patient.  The default resource check time out is ~60 seconds, so it can sometimes take a little longer before a change is detected and the job it triggered.

If all goes well, you should see a "Build Successful" message at the end of the logs.  You've successfully set up a continuous integration (CI) pipeline for a project that validates against its own test cases.

## Extra Credit

Make a change to the project and commit and push to your GitHub.  Did the pipeline pick up the change and trigger another build automatically?

## Extra Extra Credit

Modify the unit-test task to have the gradle build ouput with debug information.