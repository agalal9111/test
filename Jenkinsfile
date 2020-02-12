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
                          
                             """
                          
                    }
                  }
                }
                 stage('PreDeploy'){
                  steps{
                    script{
                          sh """
                             ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline/dist/
                             cp -R /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline/dist/* /pet      
                             ls /pet
                             
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
