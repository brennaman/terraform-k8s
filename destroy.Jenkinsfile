pipeline {
  environment {
    TF_VAR_PUBLIC_SSH_KEY = credentials('PUBLIC_SSH_KEY')
    TF_VAR_AZURE_CLIENT_ID = credentials('AZURE_CLIENT_ID')
    TF_VAR_AZURE_CLIENT_SECRET = credentials('AZURE_CLIENT_SECRET')
    TF_VAR_AZURE_AKS_ADMIN_USER = credentials('AZURE_AKS_ADMIN_USER')
    TF_VAR_AZURE_AKS_AAD_SERVER_SECRET = credentials('AZURE_AKS_AAD_SERVER_SECRET')
    TF_VAR_AZURE_AKS_AAD_SERVER_APP_ID = credentials('AZURE_AKS_AAD_SERVER_APP_ID')
    TF_VAR_AZURE_AKS_AAD_CLIENT_APP_ID = credentials('AZURE_AKS_AAD_CLIENT_APP_ID')
    TF_VAR_AZURE_SUBSCRIPTION_ID = credentials('AZURE_SUBSCRIPTION_ID')
    TF_VAR_AZURE_TENANT_ID = credentials('AZURE_TENANT_ID')
    TERRAFORM_BACKEND_RESOURCE_GRP_NAME = credentials('TERRAFORM_BACKEND_RESOURCE_GRP_NAME')
    TERRAFORM_BACKEND_STORAGE_ACCT_NAME = credentials('TERRAFORM_BACKEND_STORAGE_ACCT_NAME')
    TERRAFORM_BACKEND_CONTAINER_NAME = credentials('TERRAFORM_BACKEND_CONTAINER_NAME')
    TERRAFORM_BACKEND_KEY = credentials('TERRAFORM_BACKEND_KEY')
  }
  agent any
  stages {
    stage("Docker Pull") {
      steps{
        sh "docker pull terraform-azurecli:light"
      }
    }
    stage("Terraform Init") {
      steps{
        sh '''
          docker run -w /data \
          -e "ARM_SUBSCRIPTION_ID=$TF_VAR_AZURE_SUBSCRIPTION_ID" \
          -e "ARM_TENANT_ID=$TF_VAR_AZURE_TENANT_ID" \
          -e "ARM_CLIENT_ID=$TF_VAR_AZURE_CLIENT_ID" \
          -e "ARM_CLIENT_SECRET=$TF_VAR_AZURE_CLIENT_SECRET" \
          brennaman3/terraform-azurecli:light init \
          -backend-config="resource_group_name=$TERRAFORM_BACKEND_RESOURCE_GRP_NAME" \
          -backend-config="storage_account_name=$TERRAFORM_BACKEND_STORAGE_ACCT_NAME" \
          -backend-config="container_name=$TERRAFORM_BACKEND_CONTAINER_NAME" \
          -backend-config="key=$TERRAFORM_BACKEND_KEY"
          '''
      }
    }
    stage("Terraform Apply") {
      steps{
        sh '''
          docker run -w /data \
          -e "ARM_SUBSCRIPTION_ID=$TF_VAR_AZURE_SUBSCRIPTION_ID" \
          -e "ARM_TENANT_ID=$TF_VAR_AZURE_TENANT_ID" \
          -e "ARM_CLIENT_ID=$TF_VAR_AZURE_CLIENT_ID" \
          -e "ARM_CLIENT_SECRET=$TF_VAR_AZURE_CLIENT_SECRET" \
          brennaman3/terraform-azurecli:light destroy -auto-approve
          '''
      }
    }
    // stage('Cleanup') {
    //   steps{
    //     sh "rm -rf *"
    //   }
    // }

    
  }
}