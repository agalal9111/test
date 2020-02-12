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
                 stage('Deploy'){
                  steps{
                    script{
                          sh """
                             ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             docker run --name=apache01-d -v /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline:/var/www/html -p 2000:80 centos/httpd:latest
                       
                             """
                    }
                  }
                 }
        }
  

}
