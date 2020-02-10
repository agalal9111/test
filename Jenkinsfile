pipeline {
    agent none
    stages { 
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
                stage('Deploy'){
            agent any
                  steps{
                    script{
                          sh """
                          
                          ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                          }
                          }
                          }
}
}
