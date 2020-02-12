pipeline {

  agent { dockerfile true }



        stages {

            stage('checkout SCM'){

              steps{

                   

                   git 'https://github.com/spring-petclinic/spring-petclinic-angular.git'

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
                          ng build
                             """
                          
                    }
                  }
                }
                 stage('Deploy'){
                  steps{
                    script{
                          sh """
                             ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@4/dist
                             
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
