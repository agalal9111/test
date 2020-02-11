pipeline {

    agent { docker { image 'node:latest' } }

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
                          sudo npm install -g @angular/cli@latest
                          npm install --save-dev @angular/cli@latest
                          rm -rf package-lock.json
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
