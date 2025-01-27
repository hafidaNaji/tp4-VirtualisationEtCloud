pipeline {
    environment {
        registry = "hafidanaji84677/tp5" // Nom de l'image Docker
        registryCredential = 'dockerhub' // Identifiants Docker Hub dans Jenkins
        dockerImage = '' // Variable pour l'image Docker
    }
    agent any

    stages {
        // Stage 1: Cloner le dépôt Git
        stage('Cloning Git') {
            steps {
                git 'https://github.com/hafidaNaji/tp4-VirtualisationEtCloud.git'
            }
        }

        // Stage 2: Construire l'image Docker
        stage('Building image') {
            steps {
                script {
                    // Construire l'image Docker avec le tag BUILD_NUMBER
                    dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
                }
            }
        }

        // Stage 3: Tester l'image Docker
        stage('Test image') {
            steps {
                script {
                    // Pour l'exemple, on simule un test. Ici vous pouvez ajouter vos tests réels.
                    echo "Tests passed"
                }
            }
        }

        // Stage 4: Écrire dans un fichier
        stage('Write to file') {
            steps {
                script {
                    // Exemple d'écriture dans un fichier texte
                    bat 'echo Build number: ${BUILD_NUMBER}, Image: ${dockerImage.id} >> build_info.txt'
                }
            }
        }

        // Stage 5: Publier l'image sur Docker Hub
        stage('Publish Image') {
            steps {
                script {
                    // Se connecter à Docker Hub et pousser l'image construite
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
