# SPACE LEGACY

*Not everything returns from space.* · Por Mineros del Espacio

Una aventura para **Minecraft Java 1.21.1** con **Ad Astra**: viajas a la Luna en cohete y recuperas los «ecos» de 12 objetos reales que la humanidad dejó allí. Te guía ECO, una vieja IA de control de misión, y las propias máquinas te cuentan su historia.

## Instalar (un clic)

1. Cierra el launcher de Minecraft.
2. Doble clic en **`Instalar Space Legacy.bat`**.
3. Abre el launcher, elige el perfil **Space Legacy** y pulsa Jugar.
4. Un jugador → mundo **Space Legacy**.

El instalador crea un perfil y una carpeta de juego aparte (`%APPDATA%\.spacelegacy`). No toca tus otros mods ni mundos. Para pasárselo a otra persona, envíale `SpaceLegacy-para-compartir.zip`: lo descomprime y hace lo mismo.

## Qué hay dentro

- **12 misiones reales**: Eagle (Apolo 11), Lunar Rover, ALSEP, Surveyor 3, objetos personales de los astronautas, Luna 2, Lunokhod 1, Chandrayaan-3, Chang'e 4, SLIM, Beresheet y Lunar Prospector.
- **17 modelos 3D** de los objetos, la mayoría a tamaño real (ver `vista-previa-modelos.png`).
- **10 secretos** escondidos (objetos reales menos conocidos).
- **Museo** que se va llenando con maquetas, y un **Muro del Legado** donde queda tu nombre al terminar.
- **Ad Astra**: cohete, traje con oxígeno, rover para conducir y la Tierra en el cielo. La «Luna» del menú del cohete lleva a este mapa.

## Comandos

| Comando | Qué hace |
| --- | --- |
| `/trigger luna` | Viaje rápido a la Luna (sin cohete) |
| `/trigger tierra` | Volver |
| `/trigger base` | Ir a la Base Legado |
| `/trigger expedientes` | Recuperar los libros |
| `/function spacelegacy:admin/reset_me` | Borrar tu progreso para repetir una grabación |
| `/function spacelegacy:admin/reset_museum` | Vaciar el museo |
| `/function spacelegacy:admin/complete_all` | Completar todo de golpe (para grabar el final) |

## Archivos

| Archivo | Para qué |
| --- | --- |
| `Instalar Space Legacy.bat` | Instalador |
| `modpack/` | Mods, mundo y paquete de recursos que copia el instalador |
| `SpaceLegacy.zip` | Solo el datapack (para ponerlo en otro mundo) |
| `SpaceLegacyRP.zip` | Solo el paquete de recursos (modelos 3D y cielo) |
| `tools/content.js` | **Textos**: misiones, voces, preguntas, expedientes y secretos |
| `tools/models.js` | Modelos 3D |
| `tools/build.js` | Generador del datapack |

Para regenerar después de cambiar algo: `node tools/models.js` y `node tools/build.js`.

## Rigor

Todas las misiones y objetos son reales. Lo que no es real: ECO (el narrador), que las máquinas «hablen», y que todo esté junto (en la Luna hay cientos o miles de kilómetros entre un lugar y otro). Los datos aún no se han contrastado uno por uno con las fuentes de NASA, ISRO, CNSA y JAXA: hay que revisarlos antes de presentar.

Ad Astra y sus librerías son de sus autores (Terrarium) y se descargaron de Modrinth.
