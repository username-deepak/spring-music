# 04 Deploy Artifact to Cloud Foundry

This final lab will build on everything we've done so far.  To continue the theme, we will add a job to deploy the built artifact to Cloud Foundry.  To do so, we will need to define a new resource that encapsulates the `cf` CLI.

## Review the pipeline.yml

You should notice the new resource type `cf`.  This is another built-in resource type.  You can read more about it here: https://github.com/concourse/cf-resource






# Extra Credit

Modify the cf job to add an environment variable.