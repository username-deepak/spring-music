# 02 Build Artifact

This lab will build on what was learned in the first lab.

## Review the pipeline.yml

We are adding an additional resource to this pipeline of type "semver".  This is a special built-in resource type that help to keep track of an artifacts build version using Symantic Versioning (e.g. X.Y.Z).  Additionally, we have added a second job that will package the repository into a deployable binary.

This lab will also demonstrate how Jobs can be effectively chained together with the output(s) of one becoming the input(s) of the other.

## Review the Task build-artifact

Notice how Tasks may have multiple inputs.  In this case these inputs manifest as folders on the Concourse worker with the name specified on the input.  This allows for discovery of the output of multiple upstream resources and tasks.  We can also define output(s) that can be used by later jobs.  In our sample here, we are creating a "builds" output folder and copying the packaged artifact into that folder before exiting.

Additionally, the semver resource was configued to pull the version resource from an S3 compatible file store.  We will need to set that up for this lab.

## Create a bucket in Minio

If you were successful in deploying a Minio instance early, log into the UI and create a new bucket called "music".  This bucket will be used during the remaining labs.

## Set up a credentials.yml

Copy the vars.yml file in the current folder to a file called credentials.yml (we as using this specific name since there is a top-level .gitignore rule that ignores files of this name when commmiting code -- its important to not accidentially checking in code with credentials/secrets).  Opemn the credentials.yml and supply the correct values for your Minio instance.

## Fly

Now lets update the existing pipeline with our updates:

```
fly -t main set-pipeline -p spring-music -c pipeline.yml -v username=<your username> -l credentials.yml
```

The additional `-l` parameter allows for loading multiple parameter values from exteranl files.  You may have more than one of these parameter files.  Parameter files that contain secrets should be careful managed as to not leak these credentials to others[*].

After you apply the changes, review the pipeline.  The additional job should trigger automatically and, if all goes well, turn green.  This time, the pipeline did not need to re-execute from the beginning because the state of the previous job was successful.

Note however, that there are no new files in the Minio bucket.  This is because we haven't done anything with the output if this job.  We'll address this in the next lab.

## Extra Credit

Set the initial version to something other than 1.0.0 - say 2.1.5.

## Extra Extra Credit

Parameterize the version so it can be passed via the fly command line.



[*] See https://concourse-ci.org/creds.html for a deeper discussion about options for managing credentials external to Concourse.
