pipeline {
   
   agent {
      label 'dedicated-slave'
   }

   tools {
      maven 'maven-3.6.0'
      jdk 'java8'
   //  dockerTool 'docker'
      
   }

   stages {
      stage("Checkout Code") {
         steps {
            checkout scm
         }
      }
      stage("Docker Test"){
         steps {

            sh "docker ps"
         }
      }
   /*   stage("JUnit Test") {
         steps {
          sh "'${M2_HOME}/bin/mvn' clean test"
         }
      }
      stage("Integration Test") {
         steps {
         sh "'${M2_HOME}/bin/mvn' integration-test"
         }
      }
      stage("Perfromance Test") {
         steps {
            sh "'${M2_HOME}/bin/mvn' verify"
         }
      }
      */
      stage("Docker Build and Tag") {
         steps {
            sh "docker build -t pranaycirruslabs/calculator:$BUILD_NUMBER ."
            sh "docker ps"
            sh "docker images ps"
            //sh "docker run pranaycirruslabs/calculator:$BUILD_NUMBER"
            
            //sh "docker tag calculator pranaycirruslabs/calculator:$BUILD_NUMBER"
         }
      }
      stage("Docker Push") {
         steps {
            withDockerRegistry(credentialsId: 'pranaycirruslabs', url: 'pranaycirruslabs/calculator') {
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