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
                 stage('PreDeploy'){
                  steps{
                    script{
                          sh """
                             ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@4/dist
                             sudo mkdir /home/ec2-user/petclinic/
                             cp -R /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@4/dist/* /home/ec2-user/petclinic/
                             echo -e "RewriteEngine On
                             \n# If an existing asset or directory is requested go to it as it is
                             \nRewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -f [OR]
                             \nRewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -d
                             \nRewriteRule ^ - [L]" > /home/ec2-user/petclinic/.htaccess
                             
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
