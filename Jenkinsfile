
def secrets = [
        [$class: 'VaultSecret', path: 'secrets', secretValues: [
            [$class: 'VaultSecretValue', envVar: 'SUBSCRIPTION_ID', vaultKey: 'azuretest1']]]
    ]

def configuration = [$class: 'VaultConfiguration',
                         vaultUrl: 'http://pbjenk01.eastus.azurecontainer.io:8200',
                         vaultCredentialId: 'vault-app-role20']

pipeline {
    agent any

    stages {
        stage('test_vault_access') {
            steps {
                wrap([$class: 'VaultBuildWrapper', configuration: configuration, vaultSecrets: secrets]) {
                    sh 'echo $SUBSCRIPTION_ID'}
                }
            }
        
        stage('test') {
            steps {
                echo 'Testing..'
            }
        }
    }
}