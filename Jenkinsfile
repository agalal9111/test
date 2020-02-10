pipeline {
    agent none
    stages {
        stage('SCM') {
            agent { dockerfile true }
            steps {
                 git 'https://github.com/agalal9111/test.git' 
            }
        }
         stage('build'){
            agent { dockerfile true }
                  steps{
                    script{
                          sh """
                          npm install --save-dev @angular/cli@latest
                          npm install
                          npm audit fix --force
                          ng update @angular/cdk --allow-dirty --force
                          ng build
                             """                 
                    }
                  }
                }
}
}
