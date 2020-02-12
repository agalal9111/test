pipeline {

    agent { dockerfile true }

    stages { 

      stage('Checkout'){

        steps{

          git 'https://github.com/agalal9111/spring-petclinic-angular'

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
                          ls /usr/src/app
                          
                             """                 

                    }

                  }

                }
               stage('Unit Test'){
                  steps{
                          
                          sh "ng test --watch=false --browsers=ChromeHeadless"
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
