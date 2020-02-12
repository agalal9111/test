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
                          npm install
                          npm audit fix --force
                          ng update @angular/cdk --allow-dirty --force
                        
                          ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
                             """                 
                    }
                  }
                }
                
                          
                           
} //end of stages SCM
            stages{
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
                             """
            }
                  }
                }
            }

}
