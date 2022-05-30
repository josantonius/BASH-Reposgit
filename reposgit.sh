#!/bin/bash
# -*- ENCODING: UTF-8 -*-
#
########################################################################################
#                                                                                      #
# Automatically creates and uploads PHP-based repositories to GitHub.                  #
#                                                                                      #
# author:     Josantonius - hello@josantonius.dev                                      #
# copyright:  Copyright (c) 2016                                                       #
# license:    https://opensource.org/licenses/MIT - The MIT License (MIT)              #
# version:    1.0.0                                                                    #
# link:       https://github.com/josantonius/bash-reposgit                             #
# since:      2016-11-28                                                               #
#                                                                                      #
#                                   ···············                                    #
#                                                                                      #
# Usage: reposgit.sh [options]                                                         #
#                                                                                      #
# Options:                                                                             #
#   -h   help message                                                                  #
#   -r   delete user default settings                                                  #
#                                                                                      #
########################################################################################

#------------------------------------------------
#   Script info
#------------------------------------------------

scriptName="reposgit"
scriptFullname="BASH-Reposgit"

#------------------------------------------------
#   Translations
#------------------------------------------------

langCode="${LANG:0:2}"

test "${langCode}" == "es"

T=$?

msgScriptDescription=(  "Crea y sube repositorios PHP compatibles con Composer en GitHub"
                        "Create and upload Composer-compatible PHP repositories on GitHub")
msgCommandsList=(       "Lista de comandos disponibles para" "Commands list available for")
msgStartProgram=(       "Iniciar programa" "Start program")
msgHelpCommand=(        "Comando de ayuda" "Help command")
msgDelSettingAsk=(      "Eliminar configuración de usuario" "Delete user settings")
msgSettingsDeleted=(    "La configuración se ha eliminado con éxito" "Settings deleted successfully")
msgMainMenu=(           "·          CREAR REPOSITORIO PHP COMPOSER PARA GITHUB          ·"
                        "·          CREATE PHP COMPOSER REPOSITORY FOR GITHUB           ·")
msgConfigExists=(       "Ya existe una configuración guardada en" 
                        "A saved configuration already exists in")
msgType=(               "Escribe" "Type")
msgToRestart=(          "para reiniciar" "to restart")
msgLibrariesCategory=(  "Categoría para librerías" "Category for libraries")
msgUsername=(           "Nombre de usuario" "Username")
msgRepositorySinc=(     "El repositorio ya se ha sincronizado anteriormente con GitHub" 
                        "The repository has already been previously synced with GitHub")
msgDeleteDirectory=(    "¿Eliminar el directorio '.git' y volver a sincronizar?" 
                        "Delete directory '.git' and synchronize?")
msgGoTo=(               "Entra en" "Go to")
msgDeleteDirIfExists=(  "Si existe el repositorio, elimínalo antes de continuar" 
                        "If the repository exists, delete it before continuing")
msgContinue=(           "¿CONTINUAR?" "CONTINUE?")
msgRenamingDirectory=(  "Renombrando directorio '.git' y creándolo de nuevo" 
                        "Renaming directory '.git' and creating it again")
msgAbort=(              "No se realizarán acciones. Abortando" 
                        "No action will be taken. Aborting")
msgRepositoryExists=(   "El repositorio ya existe pero no se ha sincronizado con GitHub" 
                        "The repository already exists but has not been synchronized with GitHub")
msgNamespaceName=(      "Nombre del namespace" "Namespace name")
msgRepositoryDesc=(     "Descripción del repositorio" "Repository description")
msgClassDescription=(   "Descripción de la clase" "Class description")
msgCreatingDirectory=(  "Creando directorio en" "Creating directory in")
msgAddClassAsk=(        "¿Deseas añadir otra clase?" "Do you want to add another class?")
msgInvalidOption=(      "no es una opción válida" "invalid option")
msgAddClassException=(  "¿Deseas añadir un manejador de excepciones?" 
                        "Do you want to add an exception handler?")
msgAddClassTests=(      "¿Deseas añadir una clase para tests?" 
                        "Do you want to add a class for tests?")
msgStrictTypesAsk=(     "¿La clase tiene tipos de datos estrictos?" 
                        "Does class have strict data types?")
msgClassStrictTypes=(   "Declarando datos estrictos en la clase" 
                        "Declare strict data types in the class")
msgUseExampleAsk=(      "¿Añadir otro ejemplo de uso?" "Add another use example?")
msgUploadRepository=(   "¿Quieres subir el repositorio a GitHub?" 
                        "Do you want to upload the repository to GitHub?")
msgGitInit=(            "Iniciar repositorio git" "Start git repository")
msgGitAdd=(             "Agregar archivos a repositorio git" "Add files to git repository")
msgGitCommit=(          "Comentar archivos" "Comment files")
msgGitTag=(             "Versionar archivos con la versión" "Versioning files with version")
msgGitApi=(             "Crear repositorio en" "Create repository in")
msgGitRemote=(          "Sincronizar repositorio GitHub con" "Synchronize GitHub repository with")
msgGitPush=(            "Subir archivos a repositorio" "Upload files to repository")
msgGitMaster=(          "EL REPOSITORIO SE HA SUBIDO CON ÉXITO" 
                        "THE REPOSITORY WAS SUCCESSFULLY UPLOADED")
msgCompatibleRepo=(     "¿Esta librería es compatible con HHVM?" 
                        "Is the library compatible with HHVM?")
msgRepositoryPrefix=(   "Prefijo para los repositorios" "Prefix for the repositories")
msgLicenseType=(        "Tipo de licencia para el repositorio" "Repository license type")
msgCreatingLicense=(    "Creando licencia" "Creating License")
msgVersionPHPRequire=(  "Versión PHP requerida" "PHP version required")
msgPHPVersion70=(       "Versión 7.0 o superior" "Version 7.0 or higher")
msgPHPVersion56=(       "Versión 5.6 o superior" "Version 5.6 or higher")
msgPHPVersion55=(       "Versión 5.5 o superior" "Version 5.5 or higher")
msgUnrecognizedOption=( "Opción no reconocida" "Unrecognized option")
msgMinimumPHPRequired=( "Versión mínima de PHP requerida" "Minimum PHP version required")
msgClassName=(          "Nombre de la clase" "Class Name")
msgClassVersion=(       "Versión de la clase" "Class version")
msgRepositoryVersion=(  "Versión del repositorio" "Repository version")
msgAddingClass=(        "Añadiendo clase" "Adding class")
msgCreatingFile=(       "Creando archivo en" "Creating file in")
msgMethodFound=(        "Método encontrado" "Method found")
msgEnterKeywords=(      "Introduce palabras clave para el repositorio" 
                        "Enter repository keywords")
msgAddingTerm=(         "Añadiendo término" "Adding term")
msgSaveConfig=(         "Guardando configuración en" "Saving settings in")
msgAddHeader=(          "Añadiendo header en" "Add header in")
msgDefineClassUsage=(   "Introduce ejemplo de uso para añadirlo a la documentación" 
                        "Enter usage example to add to documentation")
msgAddUsageExample=(    "Añadiendo ejemplo de uso en archivos README" 
                        "Adding usage example to README files")  
msgEnterClassCode=(     "Introduce el código de la clase" 
                        "Enter the class code")  
msgAddingCode=(         "Añadiendo código en" 
                        "Adding code in") 
msgExits=(              "EL REPOSITORIO SE HA CREADO CON ÉXITO" 
                        "THE REPOSITORY HAS BEEN CREATED SUCCESSFULLY")
msgSpanish=(            "en español" "in spanish")
msgEnglish=(            "en inglés" "in english")
msgYesNo=(              "s/n" "y/n")    

#------------------------------------------------
#   Predefined variables
#------------------------------------------------

year=$(date +%Y)
actualDate=$(date +%Y-%m-%d)
addStrictTypes=""
#repositoryPrefix=""
repositoryPrefix="PHP-"

#------------------------------------------------
#   Configuration files
#------------------------------------------------

config="${HOME}/.${scriptName}/config"

#------------------------------------------------
#   Colors
#------------------------------------------------

GREEN="\033[1;32m"
PURPLE="\033[1;35m"
MSGC="\033[0m"
NC="\033[0m" 

#------------------------------------------------
#   Ascii
#------------------------------------------------

DS="\x5c"       # \
DSS="\x2f"      # /
accent="\x60"   # `
dollar="\x24"   # $
quotes="\x22"   # "
lessThan="\x3c" # <
question="\x3f" # ?

#------------------------------------------------
#   Commands
#------------------------------------------------

#
# [-h] Help
#
comHelp="-h"

if [ "$1" = "${comHelp}" ]; then

    sleep 0.05; printf "\n${msgScriptDescription[${T}]}.\n"
    sleep 0.05; printf "\n${msgCommandsList[${T}]} ${scriptName}:\n"
    sleep 0.05; printf "\n ${GREEN}  ${NC} ./${scriptName}    | ${msgStartProgram[${T}]}."
    sleep 0.05; printf "\n ${GREEN}-h${NC} ./${scriptName} -h | ${msgHelpCommand[${T}]}."
    sleep 0.05; printf "\n ${GREEN}-r${NC} ./${scriptName} -r | ${msgDelSettingAsk[${T}]}.\n\n"

    exit
fi

#
# [-r] Delete user default settings
#
comRestart="-r"

if [ "$1" = "${comRestart}" ]; then

    if [ -e "$config" ]; then
        rm $config
    fi
    sleep 0.05; printf "\n${MSGC}${msgSettingsDeleted[$  {T}]}.\n\n"
    exit
fi

#------------------------------------------------
#   Main Menu
#------------------------------------------------

clear
sleep 0.1; 
printf "${GREEN}
----------------------------------------------------------------
${msgMainMenu[${T}]}
·                                                              ·
·                        BY JOSANTONIUS                        ·
----------------------------------------------------------------
"
#------------------------------------------------
#   Check if element exists in array
#------------------------------------------------
function containsElement {

  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 1; done
  return 0

}

#------------------------------------------------
#   Check if user configuration exists
#------------------------------------------------

function checkUserSetting {

    #
    # If user configuration file exists
    #
    if [ -f $config ]; then

        #
        # Load user information
        #
        source $config

        sleep 0.2;  printf "\n ${PURPLE}${msgConfigExists[${T}]} ${NC}${config}${PURPLE}."
        sleep 0.2;  printf "\n ${PURPLE}${msgType[${T}]} ${NC}${scriptName} ${comRestart}${PURPLE} ${msgToRestart[${T}]}.\n"
        sleep 0.5;  printf "\n ${GREEN}· ${msgRepositoryPrefix[${T}]}:${NC} ${repositoryPrefix}"
        sleep 0.05; printf "\n ${GREEN}· ${msgLibrariesCategory[${T}]}:${NC} ${category}"
        sleep 0.05; printf "\n ${GREEN}· ${msgUsername[${T}]}:${NC} ${username}"
        sleep 0.05; printf "\n ${GREEN}· Copyright:${NC} ${copyright}"
        sleep 0.05; printf "\n ${GREEN}· Email:${NC} ${email}"

    else

        #
        # Request repository prefix
        #
        printf "\n ${GREEN}· ${msgRepositoryPrefix[${T}]}: ${NC}"

        read repositoryPrefix

        case $repositoryPrefix in
            "") repositoryPrefix="''";;
        esac

        #
        # Request category for repositories
        #
        printf "\n ${GREEN}· ${msgLibrariesCategory[${T}]}: ${NC}"

        read category

        case $category in
            "") category="empty";;
        esac

        #
        # Request GitHub username
        #
        printf "\n ${GREEN}· ${msgUsername[${T}]}: ${NC}"

        read username

        case $username in
            "") username="empty";;
        esac

        username=$(echo "$username" | sed 's/^./\u&/')


        #
        # Request copyright
        #
        printf "\n ${GREEN}· Copyright: ${NC}"

        read copyright

        case $copyright in
            "") copyright="empty";;
        esac

        #
        # Request user email
        #
        printf "\n ${GREEN}· Email: ${NC}"

        read email

        case $email in
            "") email="empty";;
        esac

        #
        # Save info in configuration file
        #
        printf "repositoryPrefix='${repositoryPrefix}';" > "${config}"
        printf "category='${category}';" >> "${config}"
        printf "username='${username}';" >> "${config}"
        printf "copyright='${copyright}';" >> "${config}"
        printf "email='${email}';" >> "${config}"

    fi

}

#------------------------------------------------
# Check if repository already created previously
#------------------------------------------------

function checkIfRepositoryExists {

    if [ -f "${namespace}/composer.json" ]; then

        repositoryVersion=$(awk 'NR > 1 {print $1}' RS='"version":\\s\\s\\s\\s\\s"' FS='",' "${namespace}/composer.json")
        repoDescription=$(awk 'NR > 1 {print $1}' RS='"description":\\s"' FS='.",' "${namespace}/composer.json")

        if [ -d "${namespace}/.git/" ]; then

            sleep 1; printf "\n${MSGC}${msgRepositorySinc[${T}]}:\n"
            printf "\n ${GREEN}· ${msgDeleteDirectory[${T}]} [${msgYesNo[${T}]}]: ${NC}"

            read confirm

            case $confirm in
                s|S|y|Y|"") 

                    sleep 0.5; printf "\n${MSGC}1 · ${msgGoTo[${T}]} https://github.com/${username}/${repositoryPrefix}${namespace}\n"
                    sleep 1;   printf "\n${MSGC}2 · ${msgDeleteDirIfExists[${T}]}\n"
                    sleep 1.5; printf "\n ${GREEN}· ${msgContinue[${T}]} [${msgYesNo[${T}]}]: ${NC}"

                    read confirm
                    case $confirm in

                        s|S|y|Y|"") 

                            random=$(($RANDOM%1000000))
                            mv "${namespace}/.git/" "${namespace}/.git-old-${random}/"
                            sleep 1; printf "\n${MSGC}${msgRenamingDirectory[${T}]}\n"

                            uploadGitHub
                        ;;

                        *)    
                            sleep 1; printf "\n${MSGC}${msgAbort[${T}]}...\n\n"
                        ;;
                    esac
                ;;
                *) 
                    sleep 1; printf "\n${MSGC}${msgAbort[${T}]}...\n\n"
                ;;
            esac

            exit

        fi

        sleep 1; printf "\n${MSGC}${msgRepositoryExists[${T}]}\n"

        askUploadGitHub
        exit

    fi

}

#------------------------------------------------
#   Save namespace for the repository
#------------------------------------------------

function setNamespace {

    sleep 0.1; printf "\n\n ${GREEN}· ${msgNamespaceName[${T}]}: ${NC}"

    read namespace

    case $namespace in
        "") namespace="empty";;
    esac

    namespace=$(echo "$namespace" | sed 's/^./\u&/')

}

#------------------------------------------------
#   Save description for repository
#------------------------------------------------

function setRepoDesc {

    sleep 0.1; printf "\n ${GREEN}· ${msgRepositoryDesc[${T}]} ${msgEnglish[${T}]}: ${NC}"

    read repoDescription

    case $repoDescription in
        "") repoDescription="empty";;
    esac

    printf "\n ${GREEN}· ${msgRepositoryDesc[${T}]} ${msgSpanish[${T}]}: ${NC}"
    read confirm

    case $confirm in
        ""|" ") repoDescriptionES=$repoDescription;;
        *)      repoDescriptionES=$confirm;;
    esac

}

#------------------------------------------------
#   Create directories
#------------------------------------------------

function setDirectories {

    mkdir -p $namespace/src

    sleep 0.1; echo -e "\n${MSGC}${msgCreatingDirectory[${T}]}: $(pwd)/${namespace}"
    sleep 0.1; echo -e "${MSGC}${msgCreatingDirectory[${T}]}: $(pwd)/${namespace}/src"

}

#------------------------------------------------
#   Ask if add a more classes
#------------------------------------------------

function askAddClass {

    printf  "\n ${GREEN}· ${msgAddClassAsk[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") addClass src;;
        n|N)         return;;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}." 
              askAddClass
        ;;
    esac

}

#------------------------------------------------
#   Ask if to add a class for exceptions.
#------------------------------------------------

function askAddClassException {

    printf "\n\n ${GREEN}· ${msgAddClassException[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") 
                if [ ! -d "${namespace}/src/Exception/" ]; then
                    mkdir -p $namespace/src/Exception
                    sleep 0.1; echo -e "\n${MSGC}${msgCreatingDirectory[${T}]}: $(pwd)/${namespace}/src/Exception"
                fi
                addClass exception
        ;;
        n|N)         return;;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}" 
              askAddClassException
        ;;
    esac

}

#------------------------------------------------
#   Ask if to add a class for tests.
#------------------------------------------------

function askAddClassTests {

    printf "\n\n ${GREEN}· ${msgAddClassTests[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") 
                if [ ! -d "${namespace}/tests/" ]; then
                    mkdir -p $namespace/tests
                    sleep 0.1; echo -e "\n${MSGC}${msgCreatingDirectory[${T}]}: $(pwd)/${namespace}/tests"
                fi
                addClass tests
        ;;
        n|N)         return;;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}" 
              askAddClassTests
        ;;
    esac

}

#------------------------------------------------
#   Ask if the class has strict data types
#------------------------------------------------

function askStrictTypes {

    printf "\n ${GREEN}· ${msgStrictTypesAsk[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") 
            addStrictTypes="declare(strict_types=1);"
            sleep 0.05; printf "\n${MSGC}${msgClassStrictTypes[${T}]}: declare(strict_types=1)\n"
        ;;
        n|N)        addStrictTypes="";;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}" 
              askStrictTypes
        ;;
    esac

}

#------------------------------------------------
#   Ask if add another use example
#------------------------------------------------

function askAddClassUsage {

    printf "\n ${GREEN}· ${msgUseExampleAsk[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") defineClassUsage;;
        n|N)        printf "";;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}" 
              askAddClassUsage
        ;;
    esac

}

#------------------------------------------------
#   Ask if to upload to GitHub.
#------------------------------------------------

function askUploadGitHub {

    printf "\n ${GREEN}· ${msgUploadRepository[${T}]} [${msgYesNo[${T}]}]: ${NC}"
    read confirm

    case $confirm in
        s|S|y|Y|"") 

            uploadGitHub
        ;;
        n|N)        sleep 0.05; printf "\n${MSGC}${msgAbort[${T}]}...\n\n";;
        *) 
              printf "\n $confirm ${msgInvalidOption[${T}]}" 
              askUploadGitHub
        ;;
    esac

}

#------------------------------------------------
#   Upload GitHub
#------------------------------------------------

function uploadGitHub {

    cd $namespace
    sleep 0.05; printf "\n${MSGC}[git init] ${msgGitInit[${T}]}\n\n"
    git init
    sleep 0.05; printf "\n${MSGC}[git add] ${msgGitAdd[${T}]}\n"
    git add .
    sleep 0.05; printf "\n${MSGC}[git commit] ${msgGitCommit[${T}]}: 'Initial upload files'\n\n"
    git commit -m "Initial upload files" -a
    sleep 0.05; printf "\n${MSGC}[git tag] ${msgGitTag[${T}]}: ${repositoryVersion}\n"
    git tag $repositoryVersion -m "Add repository version"
    sleep 0.05; printf "\n${MSGC}[git api] ${msgGitApi[${T}]} https://github.com/${username}/${repositoryPrefix}${namespace}.git\n\n"
    curl -u $username https://api.github.com/user/repos -d '{"name":"'"$repositoryPrefix""$namespace"'","description":"'"$repoDescription"'"}'
    sleep 0.05; printf "\n${MSGC}[git remote] ${msgGitRemote[${T}]} '${repositoryPrefix}${namespace}'\n"
    git remote add origin https://github.com/$username/$repositoryPrefix$namespace.git
    sleep 0.05; printf "\n${MSGC}[git push] ${msgGitPush[${T}]}\n\n"
    git push origin master --tag
    sleep 0.05; printf "\n${GREEN}${msgGitMaster[${T}]}\n\n"
    cd ..
    exit
}

#------------------------------------------------
#   Compatible with HHVM
#------------------------------------------------

function askSetHHVM {

    printf "\n ${GREEN}· ${msgCompatibleRepo[${T}]} [${msgYesNo[${T}]}]: ${NC}"

    read confirm

    case $confirm in
        s|S|y|Y|"") 
            HHVMreadmeEN1=" and is compatible with HHVM versions 3.0 or higher"
            HHVMreadmeEN2="\nTo use this library in HHVM (HipHop Virtual Machine) you will have to activate the scalar types. Add the following line ${quotes}hhvm.php7.scalar_types = true${quotes} in your ${quotes}/etc/hhvm/php.ini${quotes}.\n"
            HHVMreadmeES1=" y es compatible con versiones de HHVM 3.0 o superiores"
            HHVMreadmeES2="\nPara utilizar esta librería en HHVM (HipHop Virtual Machine) tendrás que activar los tipos escalares. Añade la siguiente ĺínea ${quotes}hhvm.php7.scalar_types = true${quotes} en tu ${quotes}/etc/hhvm/php.ini${quotes}.\n"
        ;;
        n|N)         
            HHVMreadmeEN1=""
            HHVMreadmeEN2=""
            HHVMreadmeES1=""
            HHVMreadmeES2=""
        ;;
        *) 
            printf "\n $confirm ${msgInvalidOption[${T}]}" 
            askSetHHVM 
        ;;
    esac

}

#------------------------------------------------
#   Save license
#------------------------------------------------

function setLicense {

    printf "\n ${GREEN}· ${msgLicenseType[${T}]}: ${NC}\n\n"
    options=(
        "The MIT License - MIT" 
        "Apache License - Version 2.0" 
        "The BSD 2-Clause License - BSD 2-Clause" 
        "The BSD 3-Clause License - BSD 3-Clause" 
        "The GNU General Public License - GPL-2.0" 
        "The GNU General Public License - GPL-3.0" 
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "The MIT License - MIT")
                licenseLong="https://opensource.org/licenses/MIT - The MIT License (MIT)"
                licenseCut="MIT"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/MIT-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            "Apache License - Version 2.0")
                licenseLong="https://opensource.org/licenses/Apache-2.0 - Apache License (Version 2.0)"
                licenseCut="Apache-2.0"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/APACHEv2-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            "The BSD 2-Clause License - BSD 2-Clause")
                licenseLong="https://opensource.org/licenses/BSD-2-Clause - The BSD 2-Clause License (BSD 2-Clause)"
                licenseCut="BSD 2-Clause"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/BSD2CLAUSE-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            "The BSD 3-Clause License - BSD 3-Clause")
                licenseLong="https://opensource.org/licenses/BSD-3-Clause - The BSD 3-Clause License (BSD 3-Clause)"
                licenseCut="BSD 3-Clause"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/BSD3CLAUSE-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            "The GNU General Public License - GPL-2.0")
                licenseLong="https://opensource.org/licenses/GPL-2.0 - GNU General Public License (GPL-2.0)"
                licenseCut="GPL-2.0"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/GPLv2-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            "The GNU General Public License - GPL-3.0")
                licenseLong="https://opensource.org/licenses/GPL-3.0 - GNU General Public License (GPL-3.0)"
                licenseCut="GPL-3.0"
                wget https://raw.githubusercontent.com/Josantonius/LICENSES/master/markdown/GPLv3-LICENSE.md -O $namespace/LICENSE  2> /dev/null
                break
                ;;
            *) printf "\n${msgUnrecognizedOption[${T}]} ";;
        esac
    done

    sed -i "s/<year>/${year}/g" "${namespace}/LICENSE"
    sed -i "s/<copyright holders>/${username}, https:${DSS}${DSS}github.com${DSS}${username} <${email}>/g" "${namespace}/LICENSE"

    sleep 0.05; printf "\n${MSGC}${msgCreatingLicense[${T}]} ${licenseCut} → /${namespace}/LICENSE\n"

}

#------------------------------------------------
#   PHP version require
#------------------------------------------------

function setPHPVersionRequire {

    printf "\n ${GREEN}· ${msgVersionPHPRequire[${T}]}: ${NC}\n\n"
    options=(
        "${msgPHPVersion70[${T}]}" 
        "${msgPHPVersion56[${T}]}"
        "${msgPHPVersion55[${T}]}"
    )
    select opt in "${options[@]}"
    do
        case $opt in
            "${msgPHPVersion70[${T}]}")
                PHPVersionRequire="7.0"
                break
                ;;
            "${msgPHPVersion56[${T}]}")
                PHPVersionRequire="5.6"
                break
                ;;
            "${msgPHPVersion55[${T}]}")
                PHPVersionRequire="5.5"
                break
                ;;
            *) printf "\n${msgUnrecognizedOption[${T}]} ";;
        esac
    done

    sleep 0.05; printf "\n${MSGC}${msgMinimumPHPRequired[${T}]}: ${PHPVersionRequire}.0\n"

}

#------------------------------------------------
#   Save class name
#------------------------------------------------

function setClassName {

    printf "\n ${GREEN}· ${msgClassName[${T}]} [${namespace}]: ${NC}"

    read confirm

    case $confirm in
        "") 
            className="${namespace}";;
        *) 
            className="${confirm}";;
    esac

}


#------------------------------------------------
#   Save description for class
#------------------------------------------------

function setClassDesc {

    sleep 0.1; printf "\n ${GREEN}· ${msgClassDescription[${T}]} [${repoDescription}]: ${NC}"


    read confirm

    case $confirm in
        "") 
            classDescription="${repoDescription}";;
        *) 
            classDescription="${confirm}";;
    esac

}

#------------------------------------------------
#   Save class version
#------------------------------------------------

function setClassVersion {

    printf "\n ${GREEN}· ${msgClassVersion[${T}]} [${repositoryVersion}]: ${NC}"


    read confirm

    case $confirm in
        "") 
            classVersion="${repositoryVersion}";;
        *) 
            classVersion="${confirm}";;
    esac

}

#------------------------------------------------
#   Save repository version
#------------------------------------------------

function setRepoVersion {

    printf "\n ${GREEN}· ${msgRepositoryVersion[${T}]}: ${NC}"

    read repositoryVersion

    case $repositoryVersion in
        "") repositoryVersion="empty";;
    esac

}

#------------------------------------------------
#   Prepare elements depending on the class type
#------------------------------------------------

function prepareClassType {

    if [ "$1" = "exception" ]; then

        #
        # Customize parameters for this class type.
        #
        classNameProv="${className}Exception"
        classPath="src/Exception"
        classNamespace="${className}${DS}Exception"
        classUse=""
        addStrictTypes="declare(strict_types=1);"

    elif [ "$1" = "tests" ]; then

        #
        # Ask if the class has strict data types - declare(strict_types=1);
        #
        askStrictTypes

        #
        # Customize parameters for this class type.
        #
        classNameProv="${className}Test"
        classPath="tests"
        classNamespace="${className}${DS}Tests"
        classUse="use ${username}${DS}${namespace}${DS}${className};"
        classDescription="Tests class for ${className} library"
        classComment="/**\n * ${classDescription}.\n *\n * @since ${classVersion}\n */"
    
    else

        #
        # Save class name
        #
        setClassName

        #
        # Save class description
        #
        setClassDesc

        #
        # Save class version
        #
        setClassVersion

        #
        # Ask if the class has strict data types - declare(strict_types=1);
        #
        askStrictTypes

        #
        # Customize parameters for this class type.
        #
        classNameProv="${className}"
        classPath="src"
        classNamespace="${className}"
        classUse="use ${username}${DS}${namespace}${DS}Exception${DS}${classNameProv}Exception;"
        classComment="/**\n * ${classDescription}.\n *\n * @since ${classVersion}\n */"
    
    fi

}

#------------------------------------------------
#   Add data to the CHANGELOG file
#------------------------------------------------

function setChangelogFile {

    if [ "$1" = "addClass" ]; then

        printf "\n## ${classVersion} - ${actualDate}\n" >> "${namespace}/CHANGELOG.md"

        printf "* Added ${accent}${username}${DS}${classNamespace}${DS}${classNameProv}${accent} class.\n" >> "${namespace}/CHANGELOG.md"

        sleep 0.05; printf "\n${MSGC}${msgAddingClass[${T}]}: ${username}${DS}${classNamespace}${DS}${classNameProv}"

    elif [ "$1" = "addHeader" ]; then

        printf "# CHANGELOG\n" > "${namespace}/CHANGELOG.md"

        sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/CHANGELOG.md\n"
    
    elif [ "$1" = "addMethod" ]; then

        printf "* Added ${accent}${username}${DS}${classNamespace}${DS}${classNameProv}$3$2()${accent} method.\n" >> "${namespace}/CHANGELOG.md"
        
        sleep 0.05; printf "\n${MSGC}${msgMethodFound[${T}]}: ${username}${DS}${classNamespace}${DS}${classNameProv}$3$2()"

    fi

}

#------------------------------------------------
#   Add data to the CONDUCT.md file
#------------------------------------------------

function setConductFile {

cat <<EOF > "${namespace}/CONDUCT.md"
# Contributor Code of Conduct

As contributors and maintainers of this project, and in the interest of fostering an open and welcoming community, we pledge to respect all people who contribute through reporting issues, posting feature requests, updating documentation, submitting pull requests or patches, and other activities.

We are committed to making participation in this project a harassment-free experience for everyone, regardless of level of experience, gender, gender identity and expression, sexual orientation, disability, personal appearance, body size, race, ethnicity, age, religion, or nationality.

Examples of unacceptable behavior by participants include:

* The use of sexualized language or imagery
* Personal attacks
* Trolling or insulting/derogatory comments
* Public or private harassment
* Publishing other's private information, such as physical or electronic addresses, without explicit permission
* Other unethical or unprofessional conduct.

Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code, wiki edits, issues, and other contributions that are not aligned to this Code of Conduct. By adopting this Code of Conduct, project maintainers commit themselves to fairly and consistently applying these principles to every aspect of managing this project. Project maintainers who do not follow or enforce the Code of Conduct may be permanently removed from the project team.

This code of conduct applies both within project spaces and in public spaces when an individual is representing the project or its community in a direct capacity. Personal views, beliefs and values of individuals do not necessarily reflect those of the organisation or affiliated individuals and organisations.

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by opening an issue or contacting one or more of the project maintainers.

This Code of Conduct is adapted from the [Contributor Covenant](http://contributor-covenant.org), version 1.2.0, available at [http://contributor-covenant.org/version/1/2/0/](http://contributor-covenant.org/version/1/2/0/)
EOF

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/CONDUCT.md"

}

#------------------------------------------------
#   Add data to the CONDUCT.md file
#------------------------------------------------

function setContributorsFile {

cat <<EOF > "${namespace}/contributors.txt"
$username
EOF

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/contributors.txt"

}

#------------------------------------------------
#   Add data to the .editorconfig file
#------------------------------------------------

function setEditorconfigFile {

cat <<EOF > "${namespace}/.editorconfig"
root = true

[*]
charset = utf-8
indent_size = 4
indent_style = space
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true

[*.md]
trim_trailing_whitespace = false
EOF

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/.editorconfig"

}

#------------------------------------------------
#   Add data to the .gitignore file
#------------------------------------------------

function setGitignoreFile {

cat <<EOF > "${namespace}/.gitignore"
phpunit.xml
composer.phar
composer.lock
composer-test.lock
vendor/
build/artifacts/
artifacts/
docs/_build
docs/*.pyc
.git*/
.idea
.DS_STORE
EOF

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/.gitignore"

}

#------------------------------------------------
#   Add data to the composer.json file
#------------------------------------------------

function setComposerFile {

#
# Create file and header in composer.json
#
cat <<EOF > "${namespace}/composer.json"
{
    "name":        "${username,,}/${namespace,,}",
    "version":     "${repositoryVersion}",
    "type":        "library",
    "description": "${repoDescription}.",
    "keywords": [
EOF

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/composer.json"
    
    #
    # Save keywords for the repository
    #
    sleep 0.1; printf "\n\n ${GREEN}· ${msgEnterKeywords[${T}]}: ${NC}"

    read keywords

    case $keywords in
        "") keywords="empty";;
    esac

    IFS=',' read -r -a array <<< "$keywords"

    for keyword in "${array[@]}"
    do
        if [ ! "${keyword,,}" = "php" ]; then
            printf "        ${quotes}${keyword}${quotes},\n" >> "${namespace}/composer.json"
            sleep 0.05; printf "\n${MSGC}${msgAddingTerm[${T}]}: '${keyword}'"
        fi
    done

#
# Add rest of configuration in composer.json
#
cat <<EOF >> "${namespace}/composer.json"
        "PHP"
    ],
    "license": "${licenseCut}",
    "authors": [
        {
            "name":     "${username}",
            "email":    "${email}",
            "homepage": "https://github.com/${username,,}",
            "role":     "Developer"
        }
    ],
    "minimum-stability": "dev",
    "prefer-stable" : true,
    "require": {
        "php" : ">=${PHPVersionRequire}"
    },
    "autoload": {
        "psr-4": {
            "${username}\\\\${namespace}\\\": "src/"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "${username}\\\\${namespace}\\\Tests\\\": "tests/"
        }
    },
    "extra": {
        "branch-alias": {
            "dev-master": "1.0-dev"
        }
    }
}
EOF

    sleep 0.05; printf "\n\n${MSGC}${msgSaveConfig[${T}]}: /${namespace}/composer.json\n"

}

#------------------------------------------------
#   Add data to the README.md file
#------------------------------------------------

function setReadmeFile {

includeTestMenu=""
includeExceptionMenuEN=""
includeMethodsMenuEN=""

if [ -d "${namespace}/tests/" ]; then
    includeTestMenu="\n- [Tests](#tests)"
fi

if [ -d "${namespace}/src/Exception/" ]; then
    includeExceptionMenuEN="\n- [Exception Handler](#exception-handler)"
fi

if [ -f "${namespace}/READMEmethods" ]; then
    includeMethodsMenuEN="\n- [Available Methods](#available-methods)"
fi

echo -ne "# PHP ${namespace} library

[![Latest Stable Version](https://poser.pugx.org/${username,,}/${namespace,,}/v/stable)](https://packagist.org/packages/${username,,}/${namespace,,}) [![Total Downloads](https://poser.pugx.org/${username,,}/${namespace,,}/downloads)](https://packagist.org/packages/${username,,}/${namespace,,}) [![Latest Unstable Version](https://poser.pugx.org/${username,,}/${namespace,,}/v/unstable)](https://packagist.org/packages/${username,,}/${namespace,,}) [![License](https://poser.pugx.org/${username,,}/${namespace,,}/license)](https://packagist.org/packages/${username,,}/${namespace,,})

[Spanish version](README-ES.md)

${repoDescription}.

---

- [Installation](#installation)
- [Requirements](#requirements)
- [Quick Start and Examples](#quick-start-and-examples)${includeMethodsMenuEN}
- [Usage](#usage)${includeTestMenu}${includeExceptionMenuEN}
- [Contribute](#contribute)
- [Repository](#repository)
- [Author](#author)
- [Licensing](#licensing)

---

### Installation

The preferred way to install this extension is through [composer](http://getcomposer.org/download/).

To install PHP ${namespace} library, simply:

    $ composer require ${username}/${namespace}

### Requirements

This library is supported by PHP versions ${PHPVersionRequire} or higher${HHVMreadmeEN1}.
${HHVMreadmeEN2}
### Quick Start and Examples

To use this class, simply:

${accent}${accent}${accent}php
require __DIR__ . '/vendor/autoload.php';

use ${username}${DS}${namespace}${DS}${className};
${accent}${accent}${accent}" >> "${namespace}/README.md"

if [ -f "${namespace}/READMEmethods" ]; then

echo -ne "
### Available Methods

Available methods in this library:

${accent}${accent}${accent}php
${availableMethods}
${accent}${accent}${accent}" >> "${namespace}/README.md"

fi

echo -ne "
### Usage

Example of use for this library:
" >> "${namespace}/README.md"

cat "${namespace}/usage" >> "${namespace}/README.md"

if [ -d "${namespace}/tests/" ]; then

echo -ne "

### Tests 

To use the [test](tests) class, simply:

${accent}${accent}${accent}php
<?php
${dollar}loader = require __DIR__ . '/vendor/autoload.php';

${dollar}loader->addPsr4('${username}${DS}${DS}${namespace}${DS}${DS}Tests${DS}${DS}', __DIR__ . '/vendor/${username,,}/${namespace,,}/tests');

use ${username}${DS}${namespace}\Tests${DS}${className}Test;

${accent}${accent}${accent}" >> "${namespace}/README.md"

if [ -f "${namespace}/READMETestsMethods" ]; then

echo -ne "
Available test methods in this library:

${accent}${accent}${accent}php
${availableTestsMethods}
${accent}${accent}${accent}" >> "${namespace}/README.md"

fi 
fi

if [ -d "${namespace}/src/Exception/" ]; then

echo -ne "

### Exception Handler

This library uses [exception handler](src/Exception) that you can customize.">> "${namespace}/README.md"

if [ -f "${namespace}/READMEexceptions" ]; then

echo -ne "
Available exception methods in this library:

${accent}${accent}${accent}php
${availableExceptions}
${accent}${accent}${accent}" >> "${namespace}/README.md"

fi
fi

echo -ne "
### Contribute
1. Check for open issues or open a new issue to start a discussion around a bug or feature.
1. Fork the repository on GitHub to start making your changes.
1. Write one or more tests for the new feature or that expose the bug.
1. Make code changes to implement the feature or fix the bug.
1. Send a pull request to get your changes merged and published.

This is intended for large and long-lived objects.

### Repository

All files in this repository were created and uploaded automatically with [Reposgit Creator](https://github.com/Josantonius/${scriptFullname}).

### Author

Maintained by [${username}](https://github.com/${username}/).

### Licensing

This project is licensed under **${licenseCut} license**. See the [LICENSE](LICENSE) file for more info." >> "${namespace}/README.md"

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/README.md"

}

#------------------------------------------------
#   Add data to the README-ES.md file
#------------------------------------------------

function setSpanishReadmeFile {

includeExceptionMenuES=""
includeMethodsMenuES=""

if [ -d "${namespace}/src/Exception/" ]; then
    includeExceptionMenuES="\n- [Manejador de excepciones](#manejador-de-excepciones)"
fi

if [ -f "${namespace}/READMEmethods" ]; then
    includeMethodsMenuES="\n- [Métodos disponibles](#métodos-disponibles)"
fi

echo -ne "# PHP ${namespace} library

[![Latest Stable Version](https://poser.pugx.org/${username,,}/${namespace,,}/v/stable)](https://packagist.org/packages/${username,,}/${namespace,,}) [![Total Downloads](https://poser.pugx.org/${username,,}/${namespace,,}/downloads)](https://packagist.org/packages/${username,,}/${namespace,,}) [![Latest Unstable Version](https://poser.pugx.org/${username,,}/${namespace,,}/v/unstable)](https://packagist.org/packages/${username,,}/${namespace,,}) [![License](https://poser.pugx.org/${username,,}/${namespace,,}/license)](https://packagist.org/packages/${username,,}/${namespace,,})

[Spanish version](README-ES.md)

${repoDescriptionES}.

---

- [Instalación](#instalación)
- [Requisitos](#requisitos)
- [Cómo empezar y ejemplos](#cómo-empezar-y-ejemplos)${includeMethodsMenuES}
- [Uso](#uso)${includeTestMenu}${includeExceptionMenuES}
- [Contribuir](#contribuir)
- [Repositorio](#repositorio)
- [Autor](#autor)
- [Licencia](#licencia)

---

### Instalación 

La mejor forma de instalar esta extensión es a través de [composer](http://getcomposer.org/download/).

Para instalar PHP ${namespace} library, simplemente escribe:

    $ composer require ${username}/${namespace}

### Requisitos

Esta ĺibrería es soportada por versiones de PHP ${PHPVersionRequire} o superiores${HHVMreadmeES1}.
${HHVMreadmeES2}
### Cómo empezar y ejemplos

Para utilizar esta librería, simplemente:

${accent}${accent}${accent}php
require __DIR__ . '/vendor/autoload.php';

use ${username}${DS}${namespace}${DS}${className};
${accent}${accent}${accent}" >> "${namespace}/README-ES.md"

if [ -f "${namespace}/READMEmethods" ]; then

echo -ne "
### Métodos disponibles

Métodos disponibles en esta librería:

${accent}${accent}${accent}php
${availableMethods}
${accent}${accent}${accent}" >> "${namespace}/README-ES.md"

fi

echo -ne "
### Uso

Ejemplo de uso para esta librería:
" >> "${namespace}/README-ES.md"

cat "${namespace}/usage" >> "${namespace}/README-ES.md"

if [ -d "${namespace}/tests/" ]; then

echo -ne "

### Tests 

Para utilizar la clase de [pruebas](tests), simplemente:

${accent}${accent}${accent}php
<?php
${dollar}loader = require __DIR__ . '/vendor/autoload.php';

${dollar}loader->addPsr4('${username}${DS}${DS}${namespace}${DS}${DS}Tests${DS}${DS}', __DIR__ . '/vendor/${username,,}/${namespace,,}/tests');

use ${username}${DS}${namespace}\Tests${DS}${className}Test;
${accent}${accent}${accent}" >> "${namespace}/README-ES.md"

if [ -f "${namespace}/READMETestsMethods" ]; then

echo -ne "
Métodos de prueba disponibles en esta librería:

${accent}${accent}${accent}php
${availableTestsMethods}
${accent}${accent}${accent}" >> "${namespace}/README-ES.md"

fi
fi

if [ -d "${namespace}/src/Exception/" ]; then

echo -ne "

### Manejador de excepciones

Esta librería utiliza [control de excepciones](src/Exception) que puedes personalizar a tu gusto." >> "${namespace}/README-ES.md"

if [ -f "${namespace}/READMEexceptions" ]; then

echo -ne "
Métodos para excepciones disponibles en esta librería:

${accent}${accent}${accent}php
${availableExceptions}
${accent}${accent}${accent}" >> "${namespace}/README.md"

fi
fi

echo -ne "
### Contribuir
1. Comprobar si hay incidencias abiertas o abrir una nueva para iniciar una discusión en torno a un fallo o función.
1. Bifurca la rama del repositorio en GitHub para iniciar la operación de ajuste.
1. Escribe una o más pruebas para la nueva característica o expón el error.
1. Haz cambios en el código para implementar la característica o reparar el fallo.
1. Envía pull request para fusionar los cambios y que sean publicados.

Esto está pensado para proyectos grandes y de larga duración.

### Repositorio

Los archivos de este repositorio se crearon y subieron automáticamente con [Reposgit Creator](https://github.com/Josantonius/${scriptFullname}).

### Autor

Mantenido por [${username}](https://github.com/${username}/).

### Licencia

Este proyecto está licenciado bajo la **licencia ${licenseCut}**. Consulta el archivo [LICENSE](LICENSE) para más información." >> "${namespace}/README-ES.md"

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/README-ES.md"

}

#------------------------------------------------
#   Add header in PHP file
#------------------------------------------------

function addPhpFileHeader {

echo -ne "<?php ${addStrictTypes}
/**
 * ${repoDescription}.
 * 
 * @category   ${category}
 * @package    ${namespace}
 * @subpackage ${classNameProv}
 * @author     ${username} - ${email}
 * @copyright  Copyright (c) ${year} ${copyright}
 * @license    ${licenseLong}
 * @version    ${classVersion}
 * @link       https://github.com/${username}/${repositoryPrefix}${namespace}
 * @since      File available since ${classVersion} - Update: ${actualDate}
 */

namespace ${username}${DS}${classNamespace};
" > "${namespace}/${classPath}/${classNameProv}.php"

    sleep 0.05; printf "\n\n${MSGC}${msgAddHeader[${T}]}: /${namespace}/${classPath}/${classNameProv}.php\n"

}

#------------------------------------------------
#   Add class for exceptions
#------------------------------------------------

function addExceptionClass {

echo -ne "
/**
 * Exception class for ${className} library.
 *
 * You can use an exception and error handler with this library.
 *
 * @since ${classVersion}
 *
 * @link https://github.com/${username}/${repositoryPrefix}ErrorHandler
 */
class ${classNameProv} extends ${DS}Exception { 

    /**
     * Exception handler.
     *
     * @since ${classVersion}
     *
     * @param string ${dollar}msg    → message error (Optional)
     * @param int    ${dollar}error  → error code (Optional)
     * @param int    ${dollar}status → HTTP response status code (Optional)
     */
    public function __construct(string ${dollar}msg = '', int ${dollar}error = 0, int ${dollar}status = 0) {

        ${dollar}this->message    = ${dollar}msg;
        ${dollar}this->code       = ${dollar}error;
        ${dollar}this->statusCode = ${dollar}status;
    }
}" >> "${namespace}/${classPath}/${classNameProv}.php"

    sleep 0.05; printf "\n${MSGC}${msgCreatingFile[${T}]}: /${namespace}/${classPath}/${classNameProv}.php\n"

}

#------------------------------------------------
#   Search and save the methods of the class
#------------------------------------------------

function searchMethodsInClass {

    grep -oP '(?<=function\s)\w+' "${namespace}/${classPath}/${classNameProv}.php" > "${namespace}/methods"

    while read method ; do

        if [ ! -z "$method" ] ; then

            skip=0

            #
            # Php magic methods
            #
            declare -a magicMethods=(
                "__construct" 
                "__destruct" 
                "__call" 
                "__callStatic" 
                "__get" 
                "__set" 
                "__isset" 
                "__unset" 
                "__sleep" 
                "__wakeup" 
                "__toString" 
                "__invoke" 
                "__set_state" 
                "__clone" 
                "__debugInfo"
            )

            #
            # Validate if the method is static
            #
            ifStatic=$(grep "function" "${namespace}/${classPath}/${classNameProv}.php" | grep "${method}" | grep "static")

            if [ ! -z "$ifStatic" ]; then
                methodType="::"
            else
                methodType="->"
            fi

            #
            # Validate if the method is private
            #
            ifSprivate=$(grep "function" "${namespace}/${classPath}/${classNameProv}.php" | grep "${method}" | grep "private")

            if [ ! -z "$ifSprivate" ]; then
                skip=1
            fi

            #
            # Validate if the method is protected
            #
            ifSprotected=$(grep "function" "${namespace}/${classPath}/${classNameProv}.php" | grep "${method}" | grep "protected")

            if [ ! -z "$ifSprotected" ]; then
                skip=1
            fi

            #
            # Check if it is a magic method.
            #
            containsElement "${method}" "${magicMethods[@]}"

            case $? in
                1) skip=1;;
            esac

            setChangelogFile addMethod $method $methodType

            #
            # Show only public methods in README files.
            #
            if [ "$skip" = 0 ]; then

	            if [[ $classNameProv == *Test ]]; then

	                printf "${classNameProv}${methodType}${method}();\n" >> "${namespace}/READMETestsMethods"

	            elif [[ $classNameProv == *Exception ]]; then
	                
	                printf "[${classNameProv}](${classPath}/${classNameProv}.php)\n" >> "${namespace}/READMEexceptions"

	            else

	                printf "${classNameProv}${methodType}${method}();\n" >> "${namespace}/READMEmethods"

	            fi
	        fi
        fi

    done < "${namespace}/methods"

    rm ${namespace}/methods

}
       
#------------------------------------------------
#   Define class usage examples
#------------------------------------------------

function defineClassUsage {

    #
    # Request code for define class usage
    #
    printf "\n\n ${GREEN}· ${msgDefineClassUsage[${T}]}: "

    printf "\n\n${NC}<?php\n\nrequire __DIR__ . '/vendor/autoload.php';\n\nuse ${username}${DS}${namespace}${DS}${className};\n\n${NC}"

    IFS= read -d '' -n 1 -r classUsageContent
    while IFS= read -d '' -n 1 -t 2 -r c
    do
        classUsageContent+=$c
    done

echo -ne "
${accent}${accent}${accent}php
${lessThan}${question}php
require __DIR__ . '/vendor/autoload.php';

use ${username}${DS}${namespace}${DS}${className};

${classUsageContent}
${accent}${accent}${accent}" >> "${namespace}/usage"

    sleep 0.05; printf "\n\n${MSGC}${msgAddUsageExample[${T}]}\n"

    #
    # Ask if add another example use
    #
    askAddClassUsage

}

#------------------------------------------------
#   Add class
#------------------------------------------------

function addClass {

    #
    # Prepare elements depending on the class type
    #
    prepareClassType $1

    #
    # Add data to the CHANGELOG file
    #
    setChangelogFile addClass

    #
    # Add header in PHP file
    #
    addPhpFileHeader

    #
    # If it is a class for exceptions
    #
    if [ "$1" = "exception" ] ; then

        #
        # Add class for exceptions
        #
        addExceptionClass

        printf "* Added ${accent}${username}${DS}${classNamespace}${DS}Exceptions${accent} abstract class.\n" >> "${namespace}/CHANGELOG.md"

        sleep 0.05; printf "\n${MSGC}${msgAddingClass[${T}]}: ${username}${DS}${classNamespace}${DS}Exceptions\n"

        searchMethodsInClass

    #
    # If it is a class src class or test class
    #
    else

        #
        # Add use in the class
        #
        printf "\n${classUse}\n" >> "${namespace}/${classPath}/${classNameProv}.php"

        #
        # Add comment in the class
        #
        printf "\n${classComment}\n" >> "${namespace}/${classPath}/${classNameProv}.php"

        #
        # Request code for class
        #
        printf "\n${GREEN}· ${msgEnterClassCode[${T}]}: \n\n${NC}"

        IFS= read -d '' -n 1 -r classCode
        while IFS= read -d '' -n 1 -t 2 -r c
        do
            classCode+=$c
        done

        #
        # Save code for class
        #
        echo "$classCode" >> "${namespace}/${classPath}/${classNameProv}.php"

        sleep 0.05; printf "\n\n${MSGC}${msgAddingCode[${T}]}: /${namespace}/${classPath}/${classNameProv}.php\n"

        searchMethodsInClass

        #
        # Ask if adding class for exceptions if it is a src class
        #
        if [ "$1" = "src" ] ; then
            
            askAddClassException
            askAddClassTests
            defineClassUsage

        fi
    fi

}

#------------------------------------------------
# Check if user configuration exists 
#------------------------------------------------
checkUserSetting

#------------------------------------------------
# Save namespace for the library
#------------------------------------------------
setNamespace

#------------------------------------------------
# Check if repository already created previously
#------------------------------------------------

checkIfRepositoryExists 

#------------------------------------------------
# Save description for repository
#------------------------------------------------
setRepoDesc

#------------------------------------------------
# Add repository version
#------------------------------------------------
setRepoVersion

#------------------------------------------------
# Ask if class is HHVM compatible 
#------------------------------------------------
askSetHHVM

#------------------------------------------------
# Create directories
#------------------------------------------------
setDirectories

#------------------------------------------------
# Save data to the LICENSE file
#------------------------------------------------
setLicense

#------------------------------------------------
# PHP version require for this library
#------------------------------------------------
setPHPVersionRequire

#------------------------------------------------
# Add header to CHANGELOG file
#------------------------------------------------
setChangelogFile addHeader

#------------------------------------------------
# Add class
#------------------------------------------------
addClass src

#------------------------------------------------
# Ask if adding a new class
#------------------------------------------------
# askAddClass

#------------------------------------------------
# Add data to the CONDUCT.md file
#------------------------------------------------
setConductFile

#------------------------------------------------
# Add data to the contributors.txt file
#------------------------------------------------
setContributorsFile

#------------------------------------------------
# Add data to the .editorconfig file
#------------------------------------------------
setEditorconfigFile

#------------------------------------------------
# Add data to the composer.json file
#------------------------------------------------
setGitignoreFile

#------------------------------------------------
# Add data to the composer.json file
#------------------------------------------------
setComposerFile

#------------------------------------------------
# Load class usage examples
#------------------------------------------------
classUsageExamples=`cat ${namespace}/usage`

#------------------------------------------------
# Save available methods for README files
#------------------------------------------------
availableMethods=`cat ${namespace}/READMEmethods`

#------------------------------------------------
# Save available tests for README files
#------------------------------------------------
availableTestsMethods=`cat ${namespace}/READMETestsMethods`

#------------------------------------------------
# Save available tests for README files
#------------------------------------------------
availableExceptions=`cat ${namespace}/READMEexceptions`

#------------------------------------------------
# Add data to the README.md file
#------------------------------------------------
setReadmeFile

#------------------------------------------------
# Add data to the README-ES.md file
#------------------------------------------------
setSpanishReadmeFile

#------------------------------------------------
# Delete provisional files
#------------------------------------------------
rm "${namespace}/usage"
rm "${namespace}/READMEmethods"
rm "${namespace}/READMETestsMethods"
rm "${namespace}/READMEexceptions"

#------------------------------------------------
# Success message
#------------------------------------------------
sleep 0.05; printf "\n\n${GREEN}${msgExits[${T}]}\n"

#------------------------------------------------
# Ask if to upload to GitHub
#------------------------------------------------
askUploadGitHub