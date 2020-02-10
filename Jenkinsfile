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
                          ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             """                 
                    }
                  }
                }
                stage('Deploy'){
            agent any
                  steps{
                    script{
                          sh """     
                          docker-compose build
                          docker-compose up -d
                          echo "apache is up and running now"
                             """
                          }
                       }   
                               }
}
}
