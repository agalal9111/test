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
                          mkdir /home/ec2-user/petclinic
                          cp -R /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@3/dist/* /home/ec2-user/petclinic
                             """                 

                    }

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
