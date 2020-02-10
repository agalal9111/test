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
                          npm install --save-dev @angular/cli@latest
                          ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@2/
                          rm -rf /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@2/package-lock.json
                          ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@2/
                          npm install
                          npm audit fix --force
                          ng update @angular/cdk --allow-dirty --force
                          ng build
                          ls /home/ec2-user/.jenkins/workspace/FrontEnd-Pipeline@2/
                             """
                          
                    }
                  }
                }
        }

}
