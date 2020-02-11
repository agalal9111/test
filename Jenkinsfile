pipeline {

    agent { docker { image 'node:latest' } }

    stages { 

      stage('Checkout'){

        steps{

          git 'https://github.com/agalal9111/test.git'

        }

      }

         stage('build'){
                  steps{
                    script{

                          sh """
                          npm install --save-dev @angular/cli@latest
                          
                          npm install
                          npm audit fix --force
                          ng update @angular/cdk --allow-dirty --force
                          ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             """                 

                    }

                  }

                }
    }
}              
