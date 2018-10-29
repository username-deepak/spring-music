# 03 Build Artifact and Store in S3

This lab will build on the last one and introduce storing the build artifacts into external storage.

## Review the pipeline.yml

Open the pipeline.yml file and review the differences in it comparison to Lab 2.

- What are these changes?
- What do you expect will happen when we apply this pipeline congfiguration?

Discuss your thoughts with the person next to you - do they agree with your assessment?  If not, discuss why?

## Fly the new pipeline.yml

Before you run the fly command, make sure you copy over your credentials.yml file from the previous lab (or just copy the vars.yml and change the values appropriately).

Then run fly:

```
fly -t main set-pipeline -p spring-music -c pipeline.yml -v username=<your username> -l credentials.yml
```

In this case, the Job won't automatically re-run since it is already in the "SUCESSFUL" state and there is no activity that will trigger it.  Commit and push a small change to your project and watch the pipeline run automatically.  This time when the final job completes, look at the bucket in Minio and review the files stored there.

## Extra Credit

Using the git resource documention (https://github.com/concourse/git-resource), add a step in the build-binary job that tags the repo with the new version.

