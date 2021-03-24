pipeline {
   
   agent any

   tools {
      maven 'M3'
      docker 'docker'
   }

   stages {
      stage("Checkout Code") {
         steps {
            checkout scm
         }
      }
      stage("JUnit Test") {
         steps {
            sh "'${mvnHome}/bin/mvn' clean test"
         }
      }
      stage("Integration Test") {
         steps {
         sh "'${mvnHome}/bin/mvn' integration-test"
         }
      }
      stage("Perfromance Test") {
         steps {
            sh "'${mvnHome}/bin/mvn' verify"
         }
      }
      stage("Docker Build and Tag") {
         steps {
            sh "docker build -t pranaycirruslabs/calculator"
            sh "docker tag calculator pranaycirruslabs/calculator:$BUILD_NUMBER"
         }
      }
      stage("Docker Push") {
         steps {
            withDockerRegistry(credentialsId: 'pranaycirruslabs-docker', url: 'pranaycirruslabs/calculator') {
               sh "docker push pranaycirruslabs/calculator:$BUILD_NUMBER"
            }
         }
      }
      stage("Deploy") {
         steps {
            timeout(time: 10, unit: 'MINUTES') {
           input message: 'Deploy this web app to production ?'
         }
      }
      }
   }
}