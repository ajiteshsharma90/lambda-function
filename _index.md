+++
+++


# AWS Lambda Function

## About the project

please discribe about the project

### Prerequiristes

npm insatlled in the system.

npm install package.json
npm update package.json
npm run package.json

### Usage
    Variables
		Define below variables

| Variable Name              | Allowed Values | 
| ---------------------------|:--------------:|
| $CI_COMMIT_BRANCH          | develop        |
| $CI_COMMIT_BRANCH          | stage          |
| $CI_COMMIT_BRANCH          | test           |
| ECR_Repo                   | Repo Name      |
| AWS_ACCESS_KEY = $         | AWS_IAM        |
| AWS_SECRET_ACCESS_KEY = $  | AWS_IAM        |

Enter the access key and secret access key in secrets veribales in Gitlab, no need to hard-code it.

### Installation
	git clone (give full URL)


### Include

Include local file, enter the path of the local file 
   - local: "gitlab-ci/include.yml"
   - local: "gitlab-ci/feature.yml"
   - local: "gitlab-ci/stage.yml"
   - local: "gitlab-ci/test.yml"
   - local: "gitlab-ci/prod.yml"

### Stages

In Stages need to add all the stages that wants to be deploy in the pipeline 
    - repo-gen
    - code-quality
    - validate
    - plan-presistent
    - compliance-persistant
    - apply-persistant
    - create-schedule-persistant
    - configure-fronteir-persistant
    - crate-root-ca
    - create-certs
    - plan-env
    - compliance-env
    - applu-env
    - create-schedule-env
    - configure-frontier-envornment
    - setup-smoke-test
    - smoke-test-internal
    - set-active-stage
    - smoke-test-external
    - check-ssm-param-overrides
    - check-active-envornment
    - destory-env
    - delete-env
    - delete-schedule-env
    - delete-fronteir-persistant
    - destory-persistant
    - delete-persistant
    - delete-schedule-persistant
    - update-project-metadata
    - documentation-setup
    - generate-api-docs
    - pages
    - create-test-schedules
    - test-automation
    - test-result
    - deploy


### Script

After Staging all the reqirments now you have to script all.

### Execution
		npm run install
		npm run deploy

### conclusion 
 <about project>
as per project requirment, need to install npm and run it through npm package. package.json will run all the required steps like terrafrom. In .gitlab-ci.yml need install required code and then stages all the values, define variables script them and deply. 