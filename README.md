# Why
Goal of this repo is to provide an example of using the [Harbor Terraform Provider](https://github.com/goharbor/terraform-provider-harbor/blob/master/docs/index.md) to keep two [Harbor](https://goharbor.io/) instances in sync (settings and artifacts).

# What
This repo is managing the configuration of the following

1. Generic instance configuration
    1. Authentication
    2. Email
    3. System Settings
    4. Garbage Collection
    5. Interrogation Services
2. Bi-Directional, Event Based Replication Configuration
    1. Registry object in each instance
    2. Robot Account in each instance to allow the replication of artifacts
    3. Event Based replication rules to the configured instances

# FAQ

## What should I change?
* [./harbor/configuration.tf](./harbor/configuration.tf)
  * configure your `auth` details to match how your user's will be managed
    * don't forget to adjust the `configure_auth` variable to `true`
  * adjust any other settings in here to match your desired end state configuration

## What should I add? 
Configuration you want to keep in sync between the two instances, such as:
* projects
* retention policies
* immutable tag rule

## What is an example terraform.tfvars file

```properties
# primary instance info
primary_harbor_username = ""
primary_harbor_password = ""
primary_harbor_url      = ""

# secondary instance info
secondary_harbor_username = ""
secondary_harbor_password = ""
secondary_harbor_url      = ""

# robots - change this to generate a new password for the robots
robot_password_keeper_value = 1

# auth
config_auth = false

# email
config_email   = false
email_host     = " "
email_username = " "
email_password = " "
```