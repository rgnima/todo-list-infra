## Proyecto Final: Todo-List App con Enfoque DevOps

## Despliegue de Infraestructura con Terrafom y github Actions
### Descripción
Este repositorio contiene los archivos terrafom y configuración necesaria para el despliegue de un AKS en azure, sobre el cual se despliega la aplicación, base de datos y los componentes de monitoreo (prometheus y grafana)
El despliegue del AKS se gatilla con github actions al hacer merge a la rama main.
## Descripción de Archivos
### main.tf
Es el archivo principal que contiene el despliegue de un AKS en con nombre aksrgnima
## terraform.tf
Contiene los provider necesarios para que terraform pueda desplegar recursos en azure
### Variables
En este archivo se indica el resource group y la región en los cuales se desplegará el AKS.
### .github/workflows/terraform.yaml
Es el action que gatilla la creación/eliminación del AKS
En este archivo se definen las variables de entorno necesarias como el storage account y container previamente creados manualmente para el resguardo del tfstate o también llamado backend.
El action contiene las fases de despliegue de la infraestructura:
- Init
- Plan
- Apply
- Destroy

Se utiliza el flujo gitflow, los cambios se aplican automáticamente al aprobar el merge a la rama main