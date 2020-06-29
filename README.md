# Local CI/CD Demo

This is a local CI/CD demo based on Jenkins where everything is put under version control:

 * Global Jenkins settings - With [Jenkins Configuration as Code](https://jenkins.io/projects/jcasc/).
 * Jenkins job configurations - With [Job DSL](https://github.com/jenkinsci/job-dsl-plugin/wiki).
 * Jenkins build process - With [Pipelines](https://jenkins.io/doc/book/pipeline/)

To facilitate test and decouple external source control system depencency, it integrates with a maven test project cloned under user's home folder with a post-commit hook injected so as to trigger the pipeline automatically after a git commit to local repo.


**1. Initialize Environment**

Getting everything ready: clone maven test project, put post-commit hook in place, build jenkins docker image with customized configurations, run jenkins container mapping host's home folder etc. 
```
make run
```

Jenkins is now available at http://localhost:8080/ and you can login with credentials found in Dockerfile.

A pipeline job mvn-test is already configured with local repo path and branch.

To trigger the pipeline, you can navigate to local ~/mvn-test path, modify code in the following files and commit change.
src/main/java/com/mycompany/app/App.java
src/test/java/com/mycompany/app/AppTest.java

When job is running, you can launch Blue Ocean in Jeknins to monitor pipeline steps.

**2. Clean up**

This is to stop and remove jenkins container, delete jenkins docker image and mvn test local repo.
```
make clean
```

