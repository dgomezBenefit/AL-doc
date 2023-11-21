# Documentación de estandar para Business Central AL

## 1.- App.json

```  
  "name": "BenefIT - Facturacion Electronica",
  "publisher": "BenefIT", 
  "version": "2.2.3.16", //Usar estandar de versiones Major.Minor.Build.Revision
  "brief": "",
  "description": "Extension de CFDI 4.0 México", //UNa descripcion de la extension
  "privacyStatement": "",    
  "url": "https://www.benefit.mx/", //Fijo
  "logo": "./Images/logo_benefit.png",   //Fijo logo benefit
  "resourceExposurePolicy": {
    "allowDebugging": true,
    "allowDownloadingSource": false,
    "includeSourceInSymbolFile": true
  }
```
- logo: Cargar logo de BenefIT.
- Publisher: BenefIT.
- Description: Descripcion larga de la extension

## 2.- Nombre de extensiones
Nombre del Cliente Mayúsculas – Nombre del Requerimiento, Ej:
- BENEFIT – Facturación Electrónica
- EXCON – Hoja de Ruta


## 3.- Nombre del Servicio de la API:
Nombre del cliente Mayúsculas_Nombre del Objeto, Ej:
- BENEFIT_PurchOrdersLine
- BENEFIT_Control


## 4.- Rango de Folios y Prefijos BenefIT

- ### Personalizaciones realizadas por el Cliente           
    - 50,000 al 59,999
- ### Personalizaciones para Cliente realizadas por Benefit 
    - 60,000 al 89,999
- ### Módulos propios de BenefIT
    - 90,000 al 95,000


## 5.- Estándares para campos en la creación de tablas

-   Cuando se requiera utilizar el nombre de la compañía en el registro, el campo se llamará de la siguiente forma: 
    - CpnyName, tipo Code [30]

- Cuando se requiera utilizar un campo de línea en el registro, el campo se llamará de la siguiente forma:
    - Line No., tipo int

- #### El set de campos User que agregaremos a todas nuestras tablas, serán los siguientes:
- User01 text [250]
- User02 text [250]
- User03 text [250]
- User04 text [250]
- User05 text [250]
- User06 text [20]
- User07 text [20]
- User08 text [20]
- User09 text [20]
- User10 text [20]
- User11 datetime 
- User12 datetime 
- User13 datetime 
- User14 datetime 
- User15 datetime 
- User16 decimal
- User17 decimal
- User18 decimal
- User19 decimal
- User20 decimal
- User21 int 
- User22 int 
- User23 int 
- User24 int 
- User25 int

- #### Cuando el objetivo de un campo en la tabla, sea almacenar un ID (Ej. No Vendor), debemos de utilizar el tipo de dato CODE, en lugar del TEXT.


## 6.- Devops

Cuando subamos un cambio a devops, en la **descripción del commit** agreguemos la versión de la extensión que estamos subiendo, más una descripción breve del cambio que se está realizando, ejemplo:
Commit: v2.4 BC 23.1, Funcion Complementos de Pago

- Manejo de versiones: 
https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/version-numbers