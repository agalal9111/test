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
                          
                          
                             """                 

                    }

                  }

                }
                 stage('Deploy'){
                     agent any
                  steps{
                    script{
                          sh """     
                          mkdir /home/ec2-user/petclinic
                          echo -e "RewriteEngine On
                          \n# If an existing asset or directory is requested go to it as it is
                          \nRewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -f [OR]
                          \nRewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -d
                          \nRewriteRule ^ - [L]" > /home/ec2-user/petclinic/.htaccess
                          cp -R /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline/dist/* /home/ec2-user/petclinic
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
