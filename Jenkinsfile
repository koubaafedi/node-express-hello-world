pipeline {
    agent any
    environment {
        AZURE_SUBSCRIPTION_ID = '4f2756f6-296e-4f5d-b3d3-312dd1fead9d'
        TF_VAR_subscription_id = "4f2756f6-296e-4f5d-b3d3-312dd1fead9d"
    }
    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan  -var subscription_id=$TF_VAR_subscription_id'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var subscription_id=$TF_VAR_subscription_id'
            }
        }
    }
}
