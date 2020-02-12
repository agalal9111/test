pipeline {

  agent any

        stages {

            stage('checkout SCM'){
                agent { dockerfile true }

              steps{

                   

                   git 'https://github.com/spring-petclinic/spring-petclinic-angular.git'

              }

            }
                stage('test'){
                  agent any
                  steps{
                    script{
                          sh """
                          mkdir /home/ec2-user/pet
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
