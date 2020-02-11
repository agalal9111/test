pipeline {
    agent none
    stages { 
         stage('build'){
            agent { dockerfile true }
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
                          cp -R /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@3/dist/* /home/ec2-user/petclinic
                          docker-compose up -d
                             """
                          }
                    post{
                          success{
                               script{
                                         sh """
                                         docker-compose exec web00 sed '151 s/None/ALL/' /etc/httpd/conf/httpd.conf
                                            """
                                      }
                                 }
                          failure{
                              echo 'failed to deploy '
                                 }
                       }
                       }   
                               }
}
}
