# Lab 0

The purpose of this lab is to introduce you to the `fly` CLI and verfy that you can connect and issue commands to your instance of Concourse.

## The pipeline.yml

In this folder we have a pipeline.yml file.  Open it in your favorite editor and review the contents.

## Resources

You'll notice a single Resource called "git-repo" of type "git".  The git resource type is a built-in construct to Concourse - you can read more about it here: https://github.com/concourse/git-resource

In this case, we'll retain URI of the original repo just to test basic functionality.  In later labs we'll show you a few ways you can customize this.

## Jobs

Below the `resources` block, you see a `jobs` section.  Jobs are the way a Concouse pipleine actually does it's work.  In this case, we only have one job called "hello-world-job".  This job refers to the resource called git-repo defined above it.  Additionally, this job's `plan` tells us how this job will be processed by Concourse.  The plan here refers to a yaml file `hello-world.yml` stored in this projects ci/tasks folder.

When Concourse executes this job, it'll use the information in the ci/tasks folder of the linked git repository.

## Tasks

Open the hello-world.yml file in this projects ci/tasks folder.  You should see three sections in the yml:  platform, image-resource, and run.  This is a very simple task that will use the busybox base docker image to run an echo command.

## Fly

Now that we are familiar with the constructs that make up a simple pipleline, let's try it out.  From the command line in this folder, type:

```
fly -t main set-pipeline hello-world -c pipleline.yml
```
