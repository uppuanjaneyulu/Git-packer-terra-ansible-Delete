pipeline {
    agent any
 
    stages {
        stage('Perform Packer Build') {
            when {
                    expression {
                        params.PACKER_ACTION == 'YES'
                    }
                }
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    sh 'packer build -var-file packer-vars.json packer.json | tee output.txt'
                    sh "tail -2 output.txt | head -2 | awk 'match(\$0, /ami-.*/) { print substr(\$0, RSTART, RLENGTH) }' > ami.txt"
                    sh "echo \$(cat ami.txt) > ami.txt"
                    script {
                        def AMIID = readFile('ami.txt').trim()
                        sh "echo variable \\\"ami\\\" { default = \\\"$AMIID\\\" } >> variables.tf"
                    }
            }
        }
        stage('No Packer Build') {
            when {
                    expression {
                        params.PACKER_ACTION == 'NO'
                    }
                }
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    sh "echo variable \\\"ami\\\" { default = \\\"ami-0c543e5b1c5ba9603\\\" } >> variables.tf"
            }
        }
        stage('Terraform Plan') {
            when {
                    expression {
                        params.TERRAFORM_ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                    expression {
                        params.TERRAFORM_ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve'
            }
        }
        stage('Terraform Destroy') {
            when {
                    expression {
                        params.TERRAFORM_ACTION == 'DESTROY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform destroy --auto-approve'
                }
        }
        stage('Ansible check') {
            when {
                    expression {
                        params.TERRAFORM_ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'ansible-playbook -i hosts.cfg nginx-playbook-remote.yml --syntax-check'
                    sh 'ansible-playbook -i hosts.cfg nginx-playbook-remote.yml --check || exit 0'
                }
        }
        stage('Ansible apply for Playbook') {
            when {
                    expression {
                        params.TERRAFORM_ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'ansible-playbook -i hosts.cfg nginx-playbook-remote.yml'
                }
        }
    }
}