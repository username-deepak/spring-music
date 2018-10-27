# 01 Unit Test

This lab will build on what we just learned by executing a real build on the Spring Music application in this repository.  In addition to building the project we'll see that we can also run unit tests and potentially fail the job if something isn't working as expected.

## Review the pipeline.yml

As before we have a single resource for watching this git repository.  However, you should have immediately noticed something different.  The `((username))` in the uri.  In Concourse this is called a Parameter and these can be used in any value of the pipeline.  Parameters are very useful in makine jobs that can be reused in different contexts.  Typically, these paramaters will be registered with Concourse in a slightly different way so the actual values can be managed differently (for example if one needs a cert or password).

