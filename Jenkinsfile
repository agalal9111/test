pipeline {

    agent { dockerfile true }

    stages { 

      stage('Checkout'){

        steps{

          git 'https://github.com/spring-petclinic/spring-petclinic-angular.git'

        }

      }

         stage('build'){
                  steps{
                    script{

                          sh """
                          
                          npm install --save-dev @angular/cli@latest
                          rm -rf package-lock.json
                          npm install
                          npm audit fix --force
                          ng update @angular/cdk --allow-dirty --force
                          ng build
                          ls /home/ec2-user/
                          ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@3/dist/
                             """                 

                    }

                  }

                }
               stage('Unit Test'){
                  steps{
                          sh "ng test --watch=false"
                  }
               }  
                          
    }
    post {
    always {
      echo 'Cleaning up...'
      deleteDir()
    }
  }
}              
