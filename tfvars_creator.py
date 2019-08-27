from jinja2 import Template #this may require a pip install jinja2
from distutils.dir_util import copy_tree

#DEFAULT VALUES
default_aws_account = '1234567890'
default_opp_account = '0987654321'
default_environment_type = 'test'
default_role_name = 'AssumeKopsCrossAccount'
default_region = 'us-east-1'
default_product_domain_name = 'demo'
default_jenkins_config_url = 'https://jenkins.com'
default_http_proxy = "https://proxy.com"
default_vpc_id = "vpc-123456"
default_subnet1_id = "subnet-12345"
default_subnet2_id = "subnet-23456"
default_subnet3_id = "subnet-34567"
default_private_hosted_zone_id = "AAAAAAAAA"
default_private_hosted_zone_alias_jenkins = "Jenkins"
default_jxDomainAliasPrefix = "JX"
default_gitBitbucketServer = "https://bitbucket.com"
default_gitProviderUrl = "https://github.com"
default_gitApiToken = "jf982j3498fj349j"
default_gitUsername = "gitman"


#replaces values into the templated file, to add a value add curly braces: ex - {{value}}
aws_account = input("Enter your AWS Application Account Number (without hypens) -- default - " + default_aws_account +": ") or default_aws_account
aws_opp_account = input("Enter your AWS Operations Account Number (without hypens) -- default - " + default_opp_account +": ") or default_opp_account
environment_type = input("Enter your Environment Type (e.g. test, production) -- default - " + default_environment_type +": ") or default_environment_type
#role_name = input("KopsCrossAccount is hardcoded (ex - arn:aws:iam::<account inherited from above>:role/<<role_name>>) -- default - " + default_role_name +": ") or default_role_name
region = input("Enter your AWS Region -- default - " + default_region +": ") or default_region
product_domain_name = input("Enter the Product Domain Name -- default - " + default_product_domain_name +": ") or default_product_domain_name
jenkins_config_url = input ("Enter your clone of the 'Environment-Configuration' -- default - " + default_jenkins_config_url +": ") or default_jenkins_config_url
http_proxy = input("Enter the HTTP Proxy (IP or host name only) -- default - " + default_http_proxy +": ") or default_http_proxy
vpc_id = input("Enter your Operations VPC ID (must be pre-created) -- default - " + default_vpc_id +": ") or default_vpc_id

#Jenkins-Core configuration
private_hosted_zone_id = input("Enter your Operations Private hosted zone ID -- default - " + default_private_hosted_zone_id +": ") or default_private_hosted_zone_id
private_hosted_zone_alias_jenkins = input("Enter your Jenkins domain alias -- default - " + default_private_hosted_zone_alias_jenkins +": ") or default_private_hosted_zone_alias_jenkins


## potentially calculate subnets using a vpc_id
## would require an import of the boto library or CLI
# 
# boto 
# client = boto3.resource("ec2")
# for vpc in client.vpcs.filter(id=vpc_id):
#    for subnet in vpc.subnets.filter(Filters=[{"Name": "availabilityZone", "Values": [az["ZoneName"]]}]):
#         print(vpc, "all:", subnet)
# CLI
# filter by tag-key where it's public (needs to be in subnet name)
# aws ec2 describe-subnets --filters Name=vpc-id,Values=<vpc_id> Name=tag:Name,Values=*public* 
# loop through output to get the subnet ID's 


subnet1_id = input("Enter your Subnet AZ1 (must be pre-created) -- default - " + default_subnet1_id +": ") or default_subnet1_id
subnet2_id = input("Enter your Subnet AZ2 (must be pre-created) -- default - " + default_subnet2_id +": ") or default_subnet2_id
subnet3_id = input("Enter your Subnet AZ3 (must be pre-created) -- default - " + default_subnet3_id +": ") or default_subnet3_id

#parameters yaml for jenkins
gitUsername = input("Enter your git username -- default - " + default_gitUsername +": ") or default_gitUsername
gitApiToken = input("Enter your git API Token -- default - " + default_gitApiToken +": ") or default_gitApiToken
gitProviderUrl = input("Enter your git Provider URL -- default - " + default_gitProviderUrl +": ") or default_gitProviderUrl
gitBitbucketServer = input("Enter your git Bitbucket Server -- default - " + default_gitBitbucketServer +": ") or default_gitBitbucketServer
jxDomainAliasPrefix = input("JX Domain Alias Prefix -- default - " + default_jxDomainAliasPrefix +": ") or default_jxDomainAliasPrefix

# copy new folder structure
fromDirectory = "operations/region"
toDirectory = "operations/" + region + "/"
copy_tree(fromDirectory, toDirectory)

fromDirectory = "application/region"
toDirectory = "application/" + region + "/"
copy_tree(fromDirectory, toDirectory)

TEMPLATE_FILE = "operations/" + region + "/terraform.template.tfvars"
with open(TEMPLATE_FILE) as file_:
    template = Template(file_.read())
#add value from top section here if newly added    
rendered_file = template.render(aws_account=aws_account,environment_type=environment_type,aws_opp_account=aws_opp_account,region=region,vpc_id=vpc_id,subnet1_id=subnet1_id,subnet2_id=subnet2_id,subnet3_id=subnet3_id,product_domain_name=product_domain_name,jxDomainAliasPrefix=jxDomainAliasPrefix,http_proxy=http_proxy,jenkins_config_url=jenkins_config_url,private_hosted_zone_id=private_hosted_zone_id,private_hosted_zone_alias_jenkins=private_hosted_zone_alias_jenkins)
f = open("operations/" + region + "/terraform.tfvars" , "w")
f.write(rendered_file)
print(rendered_file)


TEMPLATE_FILE = "application/" + region + "/terraform.template.tfvars"
with open(TEMPLATE_FILE) as file_:
    template = Template(file_.read())
#add value from top section here if newly added    
rendered_file = template.render(aws_account=aws_account,environment_type=environment_type,aws_opp_account=aws_opp_account,region=region,vpc_id=vpc_id,subnet1_id=subnet1_id,subnet2_id=subnet2_id,subnet3_id=subnet3_id,product_domain_name=product_domain_name,http_proxy=http_proxy)
f = open("application/" + region + "/terraform.tfvars" , "w")
f.write(rendered_file)
print(rendered_file)

TEMPLATE_FILE = "operations/" + region + "/env-eks/jenkins/parameters.template.yaml"
with open(TEMPLATE_FILE) as file_:
    template = Template(file_.read())
#add value from top section here if newly added    
rendered_file = template.render(gitUsername=gitUsername,gitApiToken=gitApiToken,gitProviderUrl=gitProviderUrl,gitBitbucketServer=gitBitbucketServer,jxDomainAliasPrefix=jxDomainAliasPrefix,private_hosted_zone_id=private_hosted_zone_id)
f = open("operations/" + region + "/env-eks/jenkins/parameters.yaml" , "w")
f.write(rendered_file)
print(rendered_file)