pipeline {
  agent { docker { image 'node:latest' } }

        stages {
            stage('checkout SCM'){
              steps{
                   
                   git 'https://github.com/agalal9111/test.git'
              }
            stage('build') {
              steps {
                       script {
                                 sh """          
                                 npm install --save-dev @angular/cli@latest

                                     """
                               }
                     }
            }
                   

        }
}
}
