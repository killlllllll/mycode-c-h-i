provider "aws" {
 region = "ap-south-1"
}

module "react-spa-frontend-s3-cf" {
    source                 = "../../modules/services/react-spa-frontend-s3-cf"
    hosted_zone            = "cloudtoday.click" 
    domain_name            = "stgft.cloudtoday.click"
    acm_certificate_domain = "cloudtoday.click"
    zonid                  = "Z08978411J71TQQD321FO"
    env                    =  "dev123"
    acm_certificate       = "arn:aws:acm:us-east-1:991008360267:certificate/92f2310b-6c90-4f8c-bf3f-0afc9697c3c4"
    bucket_name            =  "coffeeindigo-ui"
    acl                    = "private"
    versioning             = "Disabled"
}

