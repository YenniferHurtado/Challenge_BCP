# Challenge_BCP

## Descripción
### Architectura, Diseño:
El proyecto utiliza una arquitectura de capas para organizar el código. 
Estas capas son Delivery, Domain (Core) e Infrastructure. Cada una de estas capas se divide de la siguiente manera:
- Delivery: Se encarga de la presentación y entrega de datos al usuario. Esta capa sigue el patrón de diseño *VIPER.
- Domain (Core): Esta es la capa central del proyecto, donde se modela y gestiona la lógica de negocio principal. Aquí es donde se pueden definir las entidades y reglas de negocio.
- Infrastructure: Esta capa se ocupa del acceso a bases de datos, servicios externos y modular las peticiones.

*VIPER: Este patrón divide los flujos en módulos independientes, con su propia responsabilidad: (View, Interactor, Presenter, Entity, Router). 

## Unit test 
Se agregaron Unit Test a la capa de Interactor:
<img width="312" alt="Captura de pantalla 2023-11-17 a la(s) 10 57 36" src="https://github.com/YenniferHurtado/Challenge_BCP/assets/44207529/d57a27cc-8282-438c-894f-1003535b6c5a">

## Vista 

https://github.com/YenniferHurtado/Challenge_BCP/assets/44207529/297d58af-8957-4790-bd3c-faba2b46706f

