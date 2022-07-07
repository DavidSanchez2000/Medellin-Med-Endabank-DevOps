pipeline {
    
  agent any

  stages {

        stage('Checkout Source') {
          steps {
            git 'https://github.com/DavidSanchez2000/MED_Endabank_Kubernetes_Deployment.git'
          }
        }
        stage('Deploying App to Kubernetes') {
            steps{
                kubernetesDeploy(configs: "cluster-ip-endabank.yaml", kubeconfigId: "mykubeconfig")
                kubernetesDeploy(configs: "node-port-service-endabank.yaml", kubeconfigId: "mykubeconfig")
                sshagent(['sshk8s']) {
                    sh "ssh -o StrictHostKeyChecking=no -l  davidalejandro_sanchezarias 10.0.1.6 'sudo rm -rf MED_Endabank_Kubernetes_Deployment' "
                    sh "ssh -o StrictHostKeyChecking=no -l  davidalejandro_sanchezarias 10.0.1.6 'git clone https://github.com/DavidSanchez2000/MED_Endabank_Kubernetes_Deployment.git' "
                    sh "ssh -o StrictHostKeyChecking=no -l  davidalejandro_sanchezarias 10.0.1.6 'kubectl apply -f ./MED_Endabank_Kubernetes_Deployment/backend-endabank.yaml' "
                }
            }
        }   
    }
}