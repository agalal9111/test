pipeline {

  agent { dockerfile true }



        stages {

            stage('checkout SCM'){

              steps{

                   

                   git 'https://github.com/agalal9111/test.git'

              }

            }
                stage('build'){
                  steps{
                    script{
                          sh """
                          rm -rf /spring-petclinic-angular
                          git clone https://github.com/spring-petclinic/spring-petclinic-angular.git
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
