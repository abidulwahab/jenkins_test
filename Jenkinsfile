pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = 'eu-west-2'
    }
    stages{
        stage('Checkout SCM'){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/abidulwahab/jenkins_test.git']])
                }
            }
        }
        stage('Initializing Terraform'){
            steps{
                script{
                    dir('terraform'){
                         sh 'pwd;cd terraform/ ;terraform init'
                    }
                }
            }
        }
        stage('Validating Terraform'){
            steps{
                script{
                    dir('terraform'){
                         sh 'pwd;cd terraform/ ;terraform validate'
                    }
                }
            }
        }
        stage('Previewing the infrastructure'){
            steps{
                script{
                    dir('terraform'){
                         sh 'pwd;cd terraform/ ;terraform plan'
                    }
                    input(message: "Approve?", ok: "proceed")
                }
            }
        }
        stage('Create/Destroy an EKS cluster'){
            steps{
                script{
                    dir('terraform'){
                         sh 'pwd;cd terraform/ ;terraform $action --auto-approve'
                    }
                }
            }
        }
    }
}
