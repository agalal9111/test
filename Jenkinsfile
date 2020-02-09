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
           cd wita_src/ant
           sed -i "s/VERSION/${VERSION}/g" version.properties
           sed -i "s/BUILD/${BUILD}/g" version.properties
           cat version.properties
           cp build_resources.xml build.xml && ant
           cp build_web.xml build.xml && ant
           """
            }
        }
}
