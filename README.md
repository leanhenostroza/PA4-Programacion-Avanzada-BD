CENTRO DE ESTUDIOS: ISIL
1. PROCESO DE APRENDIZAJE 4 (PA4)
 - Evaluación - Proyecto: CasoPractico-PA4
 - Curso: Programación Avanzada de Base de Datos
 - Codigo del curso:  30627

2. Integrante:
 - Jhoel Leandro Henostroza Minaya 

3.  Descripción
En este caso práctico se aborda la necesidad de organizar y controlar los procesos operativos y de datos de la organización en SQL Server, evitando registros desordenados, inconsistencias o cambios sin respaldo que dificulten el seguimiento de la información. Para ello, se trabaja sobre las tablas Clientes, Productos, Operaciones y Auditoria_Productos, permitiendo gestionar los datos principales del negocio, registrar las operaciones realizadas y mantener un control de auditoría sobre las modificaciones de productos.

4.  Objetivo
Implementar una solución estructurada y confiable en SQL Server que automatice las operaciones transaccionales del negocio, asegure la integridad de los datos mediante validaciones y garantice la trazabilidad completa de los cambios realizados sobre el inventario o catálogo de productos.

5. Desarrollo
     El trabajo se estructuró de manera secuencial y modular para facilitar su mantenimiento y verificación:
1. Análisis y diseño lógico: Revisión de las reglas del negocio y las relaciones entre las tablas base (Clientes, Productos,    Operaciones) junto con la tabla histórica (Auditoria_Productos).
2. Construcción modular de scripts: Codificación de los scripts en SQL Server dividiendo las actividades en partes ordenadas     dentro de la carpeta scripts/.
3. Pruebas y depuración: Ejecución controlada de casos de prueba (inserciones, actualizaciones y consultas) verificando que      las transacciones respondan correctamente ante datos válidos y errores controlados.
4. Documentación y respaldo:* Captura de pantallas de cada resultado exitoso y consolidación del informe técnico en la           carpeta docs/.

6. Solución propuesta
   La solución técnica desarrollada en SQL Server integra objetos programables y mecanismos de control para responder a los      requerimientos del caso:
  - Procedimientos almacenados y transacciones: Automatización del registro en Operaciones* y actualización simultánea de         Productos, asegurando atomicidad (todo se completa o se revierte ante un error).
  - Disparadores (Triggers) de auditoría: Captura automática de las modificaciones relevantes en *Productos, registrando los      valores anteriores, nuevos, fecha y usuario en la tabla Auditoria_Productos.
  - Consultas y validaciones: Sentencias estructuradas de verificación para comprobar saldos, movimientos por cliente y el        historial de auditoría.

6. Cómo ejecutar o revisar el proyecto
    Para reproducir las pruebas y verificar el funcionamiento del proyecto en *SQL Server Management Studio (SSMS)*, siga         estos pasos en orden:
  1. Revisar el informe y el detalle de las actividades en la carpeta docs/.
  2. Abrir SQL Server Management Studio (SSMS) y conectarse a la instancia local o servidor de base de datos.
  3. Ejecutar los archivos .sql alojados en la carpeta scripts/ siguiendo la numeración correlativa de cada actividad y parte      (asegurando crear o seleccionar primero la base de datos correspondiente).
  4. Ejecutar las consultas de prueba incluidas en los scripts para validar la inserción de operaciones y los registros
     generados en Auditoria_Productos.
  5. Contrastar los resultados obtenidos en consola con las capturas almacenadas en la carpeta evidencias/.

7. Evidencias
   Los respaldos visuales de la ejecución de cada script, mensajes de confirmación de SQL Server y consultas de comprobación     sobre las tablas se encuentran organizados de forma numerada en la carpeta evidencias/, complementados por el informe         técnico en docs/.

8. Conclusiones
 - La programación avanzada en SQL Server mediante procedimientos almacenados y triggers permite centralizar las reglas del      negocio directamente en el motor de base de datos, reduciendo errores manuales en las operaciones.
 - La implementación de la tabla *Auditoria_Productos* brinda trazabilidad y seguridad sobre los cambios críticos de la          información, facilitando el control interno.
 - La organización modular del repositorio (docs/, evidencias/ y scripts/) asegura que cualquier revisor pueda auditar y         reproducir el caso práctico de manera ordenada.

9. Video de exposición
Video público de YouTube: [PEGAR AQUÍ EL ENLACE]
