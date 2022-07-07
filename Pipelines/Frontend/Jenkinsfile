pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        git url: 'https://github.com/alejosuaza1022/endabank-frontend.git', branch: 'development'
        sh '''
            cd /var/lib/jenkins/workspace/CI-CD-Endabank-Frontend-Development/
            npm install --legacy-peer-deps
            npm run build
            npm cache --force clean
          '''
      }
    }
    stage('Deploy') {
      steps {
        withCredentials([file(credentialsId: 'gcloud-creds', variable: 'GCLOUD_CREDS')]) {
          sh '''
            gcloud version
            gcloud auth activate-service-account --key-file="$GCLOUD_CREDS"
            gsutil cp -r /var/lib/jenkins/workspace/CI-CD-Endabank-Frontend-Development/dist gs://medellin-med-endabank-frotend4/
            cd /var/lib/jenkins/workspace/CI-CD-Endabank-Frontend-Development/
            gcloud app deploy
            
          '''
        }
      }
    }
  }
}