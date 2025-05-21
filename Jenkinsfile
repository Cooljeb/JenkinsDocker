pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git branch :'main', url: 'https://github.com/Cooljeb/JenkinsDocker.git'
            }
        }

        stage('Vérifier les fichiers') {
            steps {
                script {
                    if (!fileExists('index.html')) {
                        error "Le fichier index.html est manquant !"
                    }
                    if (!fileExists('Dockerfile')) {
                        error "Le fichier Dockerfile est manquant !"
                    }
                }
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    dockerImage = docker.build -t("monsite-Docker")
                }
            }
        }

        stage('Supprimer conteneur existant') {
            steps {
                script {
                    def containerExists = sh(script: "docker ps -a -q -f name=monsite-Docker-conteneur", returnStdout: true).trim()
                    if (containerExists) {
                        sh "docker rm -f monsite-Docker-conteneur"
                    }
                }
            }
        }

        stage('Déployer le conteneur') {
            steps {
                sh "docker run -d -p 8081:80 --name monsite-Docker-conteneur monsite-Docker"
            }
        }
    }
}
