# Lab 0

The purpose of this lab is to introduce you to the `fly` CLI and verfy that you can connect and issue commands to your instance of Concourse.

## Review the pipeline.yml

In this folder we have a `pipeline.yml` file.  Open it in your favorite editor (vi) and review the contents.

## Resources

You'll notice a single Resource block called "git-repo" of the type "git".  The git resource type is a built-in construct to Concourse - you can read more about it here: https://github.com/concourse/git-resource

In this configuration, we'll retain URI of the original repo just to test basic functionality.  In future labs we'll show you a few ways you can customize this.

## Jobs

Below the `resources` block, you see a `jobs` section.  Jobs are the way a Concouse pipleine actually does it's work.  In this case, we only have one job called "hello-world-job".  This job refers to the resource called git-repo defined above it.  Additionally, this job's `plan` tells us how this job will be processed by Concourse.  The plan here refers to a yaml file `hello-world.yml` stored in this projects ci/tasks folder.

When Concourse executes this job, it'll use the information in the ci/tasks folder of the linked git repository.

## Tasks

Open the hello-world.yml file in this projects ci/tasks folder.  You should see three sections in the yml:  platform, image-resource, and run.  This is a very simple task that will use the busybox base docker image to run an echo command.

## Fly

Now that we are familiar with the Concourse constructs that make up this simple pipleline, let's try it out.  From the command line in this folder type:

```
fly -t main set-pipeline -p hello-world -c pipeline.yml
```

## Command Breakdown

* -t (target) determines which Concouse "team" you will be targeting
* "set-pipeline" is the command you want to execute
* -p (pipeline) the name of the pipeline
* -c (config) the config yml you want to use

Try out `fly help` to see more info about the commands that you can issue against your pipeline.

If all went well, you should get a prompt that describes the changes to be applied and fly will wait for a [yN] reponse from you before making the change.  Type in 'y' and you should see a URL to your pipleine in Concouse.  You can use this link to view the job in the UI.

Notice that fly does not automatically start the pipeline: it defauts to a "PAUSED" state.  We can either unpase the job in the UI or via the fly command line itself.  Be aware: Jobs and Resource can also be individually paused.  To start the pipeline itself, you'll need to open the sidebar (hamburger menu) and click the "play" icon on the hello-world entry.

Now wait...

Nothing happening?  This is because this job is not automatically triggered.  We'll see in later labs how to configure jobs to automatically trigger on some external event.  However, lets manually start this job by clicking on the hello-world-job and then clicking the (+) button in the upper right corner (this is the manual trigger for a job).  In reality, we'll rarely manually trigger jobs.

You should see the job turn green and a couple of steps logged to the output for this run and "Hello World" displayed.  Note, It may take a little time the first time this is run because Councourse needs to download the container image (it'll cache this to disk for later runs).

Finished Early?

## Extra Credit

Using the `fly` command line, trigger the hello-world-job.

If you are successfuly with this, look at the outpit in the UI.  Notice the difference?  Why is that?

## Extra Extra Credit

Change the output of the hello-world-job to print your name.