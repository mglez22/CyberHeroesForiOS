//
//  Preguntas.swift
//  CyberHeroe
//
//  Created by Mario on 27/04/2018.
//  Copyright © 2018 Mario. All rights reserved.
//



import Foundation

    struct Categorias{
        static var usuario : Int = 0
        static var numeroIntentos = 0
        static var historico = ["","","","",""]
        struct Categoria1 {
            static var numeroIntentos = 0
            static var historico = ["","","","",""]
            static var Nombre = "Credenciales/Privacidad"
            static var Finalizada = "False"
            struct Preguntas {
                enum Pregunta1 {
                    static let Pregunta = "Si tu pareja te pide la clave de tu terminal Dispositivo o de alguna aplicación, ¿que debes hacer?:"
                    static let correcta = "A"
                    static let consejo = "Recuerda que tus  contraseñas son información confidencial y personal que no debe saber nadie. Para cualquier emergencia los dispositivos incluyen sistemas de emergencia para no tener que desbloquearlos."
                    struct RespuestaA {
                        static let respuesta = "a) Mis claves son información que no debo compartir."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Se la doy porque estamos muy enamorados."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) No se la doy a no ser que me prometa que no se la dirá a nadie."
                    }
                }
                
                struct Pregunta2 {
                    static let Pregunta = "Si tu mejor amig@ te pide la clave de tu terminal dispositivo o de alguna aplicación, ¿que debes hacer?:"
                    static let consejo = "Recuerda que tus  contraseñas son información confidencial y personal que no debe saber nadie. Para cualquier emergencia los dispositivos incluyen sistemas de emergencia para no tener que desbloquearlos."
                    static let correcta = "B"
                    struct RespuestaB {
                        static let respuesta = "b) Mis claves son información que no debo compartir."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Se la doy porque nuestra amistad es para siempre."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) No se la doy a no ser que me prometa que no se la dirá a nadie."
                    }
                }
                
                enum Pregunta3 {
                    static let Pregunta = "A la hora de decidir la clave de acceso a una aplicación o red social, lo mejor es:"
                    static let correcta = "C"
                    static let consejo = "Recuerda que tus  contraseñas deben ser lo más seguras posibles. Una contraseña larga y con combinaciones de letras, signos y números, reduce al mínimo la posibilidad de ser robada."
                    struct RespuestaC {
                        static let respuesta = "c) Seleccionar una cadena larga que incluya letras, signos y números."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Seleccionar algo que sea fácil de recordar, como mi nombre y fecha de nacimiento."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Seleccionar una clave consensuada con un grupo de amigos."
                    }
                }
                
                
                enum Pregunta4 {
                    static let Pregunta = " Si recibo una notificación de inicio de sesión en una de mis redes sociales, y no soy yo el que está entrando:"
                    static let correcta = "A"
                    static let consejo = "Recuerda usar contraseñas distintas en cada una de tus cuentas, evitando fechas de cumpleaños o datos que puedan relacionarse contigo."
                    struct RespuestaA {
                        static let respuesta = "a) Cambio la clave de la red social en la que se ha iniciado sesión, porque en las demás tengo otra distinta."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) No hago caso a la notificación, las redes sociales son muy pesadas  con los correos."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Uso la misma clave en todas mis cuentas, por lo que cambio todas ellas."
                    }
                }
                
                enum Pregunta5 {
                    static let Pregunta = "Si me roban mi cuenta de una red social, y cambian  la contraseña y no puedo entrar, ¿qué hago?:"
                    static let correcta = "B"
                    static let consejo = "Recuerda tener siempre claves distintas, y varios correos de recuperación de contraseñas asociados a tu red social."
                    struct RespuestaB {
                        static let respuesta = "b) Tengo varios correos de recuperación de contraseña, pido una nueva contraseña y recupero mi cuenta robada."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Como uso la misma clave en todas las redes, no puedo hacer nada, ¡me han robado todas!"
                    }
                    struct RespuestaC {
                        static let respuesta = "c) No tengo nada que ocultar...Da igual que me la hayan robado."
                    }
                }
                
                enum Pregunta6 {
                    static let Pregunta = "Mi información personal, sobre domicilio, centro en el que estudio, u otro tipo de información que pueda identificarme, los puedo compartir en mis perfiles de Redes Sociales con…"
                    static let correcta = "A"
                    static let consejo = "Toda información que publiques en internet queda accesible para cualquier usuario de esa red social. Igual que a un desconocido cualquiera de la calle no le dices donde vives, tampoco lo hagas con un desconocido de la red."

                    struct RespuestaA {
                        static let respuesta = "a) Absolutamente con nadie, puesto que mis verdaderos amigos, ya los saben."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Solo los comparto con mis amigos de Internet, aunque no los conozca en persona son amigos de verdad."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Con cualquier persona en la red. Mis datos personales no tienen ningún valor ni podrían ser un peligro si caen en manos desconocidas."
                    }
                }
                
                enum Pregunta7 {
                    static let Pregunta = "Además de tener una contraseña distinta para cada servicio y construida de forma compleja, debo tener en cuenta que mi contraseña debe ser…"

                    static let consejo = "Recuerda que tus  contraseñas deben ser difíciles de averiguar. Pero nunca que deben ser tan complicadas como para no poder recordarlas. Nunca tengas una contraseña escrita en ninguna parte."
                    static let correcta = "C"
                    struct RespuestaC {
                        static let respuesta = "c) Fácil de recordar por mí y difícil de adivinar para los demás"
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Tiene que ser muy chula y divertida"
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Mis contraseñas no son importantes"
                    }
                }
            }
        }
        
        struct Categoria2 {
            static var numeroIntentos = 0
            static var historico = ["","","","",""]
            static var Nombre = "Ingeniería social, Phising."
            static var Finalizada = "False"
            struct Preguntas {
                enum Pregunta1 {
                    static let Pregunta = "Si recibo un correo de alguien que no conozco solicitando que “pinche” un enlace, qué debo hacer:"
                    static let correcta = "A"
                    static let consejo = "Nunca pinches en un enlace que te llega por correo. Pregunta a alguno de tus mayores si es un correo real, y si no lo es, elimina el correo."

                    struct RespuestaA {
                        static let respuesta = "a) No hacerlo y denunciar el caso ante un adulto"
                    }
                    struct RespuestaB {
                        static let respuesta = "b) No hacerlo"
                        
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Pinchar, a ver si es verdad que me ha tocado la lotería"
                    }
                }
                
                struct Pregunta2 {
                    static let Pregunta = "Si recibo un correo solicitándome mis credenciales para arreglar un problema relacionado con el acceso a alguna aplicación, qué debo hacer:"
                    static let correcta = "A"
                    static let consejo = "Nunca se te van a pedir contraseñas o información personal a través de un correo, se pondrán en contacto contigo de alguna otra forma. Si recibes un correo pidiendote esos datos no los des y elimínalo."

                    struct RespuestaA {
                        static let respuesta = "a) No proporcionarlas en ningún caso y denunciar el caso ante un adulto."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Proporcionarlas cuanto antes para solucionar el problema."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Proporcionarlas sólo si se trata de una aplicación de confianza."
                    }
                }
                
                enum Pregunta3 {
                    static let Pregunta = " Si recibo un SMS que dice que llame a un número de teléfono:"
                    static let correcta = "B"
                    static let consejo = "Recuerda siempre mirar el número de teléfono al que quieren que llames. Puede que sea de pago. Si de verdad es una notificación real relacionada contigo, buscarán otra forma de ponerse en contacto contigo."

                    struct RespuestaB {
                        static let respuesta = "b) Consulto con un mayor antes de llamar y lo borro si es desconocido."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Pone que es de Apple llamo sin dudar."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Contesto al SMS."
                    }
                }
                
                
                enum Pregunta4 {
                    static let Pregunta = " Suena el teléfono de casa, y es un número largo y extraño:"
                    static let correcta = "C"
                    static let consejo = "Recuerda siempre mirar el número de teléfono. Puede que sea de pago y busquen entretenerte o que devuelvas la llamada. Si de verdad es una notificación real relacionada contigo, buscaran otra forma de ponerse en contacto contigo."

                    struct RespuestaC {
                        static let respuesta = "c) Desconfío del número y consulto con mis padres o internet."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Contesto sin mirar."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Estoy muy agustito en el sofá. Si quieren algo, volverán a llamar."
                    }
                }
                
                enum Pregunta5 {
                    static let Pregunta = "Antes de introducir datos en una página web debo:"
                    static let correcta = "C"
                    static let consejo = "Es muy importante antes de introducir datos en una página web asegurarnos que ésta es de un sitio legítimo, observando su url. Son comunes ataques en los que copian el diseño de una web y su url es muy similar a la original (Ejemplo: Faceb00k.com)."

                    struct RespuestaC {
                        static let respuesta = "c) Mirar la url de la página, asegurándome que es un sitio legítimo y utiliza https."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Fijarme únicamente en el diseño de la web."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) No es necesario fijarse en nada, si hay algo de lo que preocuparse ya me avisará el antivirus."
                    }
                }
                
                enum Pregunta6 {
                    static let Pregunta = "Si recibes un correo electrónico que parece ser de la policía, solicitando que abras un fichero con la foto de un supuesto criminal, ¿Qué hago?"
                    static let correcta = "A"
                    static let consejo = "La policía tiene perfiles propios en las redes sociales para este tipo de situaciones, nunca lo harán por correo. Si aún así sigues indeciso, llama sin dudar a la comisaría."

                    struct RespuestaA {
                        static let respuesta = "a) Desconfío, el logo de la policía parece “raro”. Lo borro sin abrirlo."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Lo reenvío a mis amigos para que estén alerta."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Lo abro para ver que cara tiene ese tipo."
                    }
                }
                
                enum Pregunta7 {
                    static let Pregunta = "Recibes una llamada desde el “soporte Técnico” de tu proveedor de internet solicitando tu contraseña de Wifi para ponerte más megas de internet..."
                    static let consejo = "Nunca digas contraseñas a nadie, recuerda que son información personal, sólo tú debes saberlas."
                    static let correcta = "B"
                    struct RespuestaB {
                        static let respuesta = "b) Nunca doy mis contraseñas a nadie."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Se la doy, voy a tener más facilidad para navegar por internet."
                    }
                    struct RespuestaC {
                        static let respuesta = "c)  Siempre hay que facilitar las cosas al “soporte técnico”, están para ayudarnos."
                    }
                }
            }
        }
        struct Categoria3 {
            static var numeroIntentos = 0
            static var historico = ["","","","",""]
            static var Nombre = "Redes Sociales/Aplicaciones de Mensajeria"
            static var Finalizada = "False"
            struct Preguntas {
                enum Pregunta1 {
                    static let Pregunta = "Si al salir al patio veo que a un compañer@ le están pegando entre varios, qué debo hacer:"
                    static let correcta = "A"
                    static let consejo = "Nunca te calles ante estas situaciones, pero tampoco entres en la pelea. Avisa a un adulto para que intervenga."

                    struct RespuestaA {
                        static let respuesta = "a) Avisar a un profesor cuanto antes."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Intentar evitar que le peguen ,peleando yo con mis otr@s compañer@s."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Grabarlo y subirlo a Facebook o enviarlo por WhatsApp."
                    }
                }
                
                struct Pregunta2 {
                    static let Pregunta = "Si mi pareja me pide que le envíe una foto “comprometida”, qué debo hacer:"
                    static let correcta = "B"
                    static let consejo = "Recuerda que todo lo que envíes queda guardado, si no irías desnudo por la calle, tampoco lo hagas por internet."

                    struct RespuestaB {
                        static let respuesta = "b) No enviársela bajo ningún concepto, ya que podría utilizar esa información en mi contra en el futuro."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Enviársela para evitar que se enfade conmigo."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Enviársela porque estamos muy enamorados."
                    }
                }
                
                enum Pregunta3 {
                    static let Pregunta = "En redes sociales como Twitter:"
                    static let correcta = "A"
                    static let consejo = "Recuerda que todo lo que escribes o publicas en internet, queda a la vista de todos y para siempre."

                    struct RespuestaA {
                        static let respuesta = "a) Debo tener cuidado con lo que escribo, ya que me puede traer consecuencias."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Da igual lo que publique, puedo borrarlo."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Debo tener cuidado con lo que escribo, por si me pillan mis padres."
                    }
                }
                
                
                enum Pregunta4 {
                    static let Pregunta = "Si a través del chat de un juego de la videoconsola conozco a alguien nuevo, qué debo hacer:"
                    static let correcta = "C"
                    static let consejo = "Nunca sabemos quién se esconde detrás de la pantalla de un ordenador. Hay que ir con mucho cuidado y siempre aconsejado por un mayor."

                    struct RespuestaC {
                        static let respuesta = "c) Ser precavido y comentárselo a mis padres."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Quedar con él/ella sólo si me cae bien."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Quedar con él/ella en cualquier caso: todos nos merecemos una oportunidad."
                    }
                }
                
                enum Pregunta5 {
                    static let Pregunta = "Si en un grupo de WhatsApp me da la impresión que a un miembro se le trata mal, qué debo hacer:"
                    static let correcta = "C"
                    static let consejo = "Mensaje al contestar: Nunca te calles ante una situación como esta, intenta mediar con los abusones para que paren con su comportamiento, pero nunca entres en nuevas peleas."

                    struct RespuestaC {
                        static let respuesta = "c) Intentar mediar para que lo dejen tranquilo."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Si no me cae bien, sumarme a l@s compañer@s que lo tratan mal."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Salirme del grupo de WhatsApp."
                    }
                }
                
                enum Pregunta6 {
                    static let Pregunta = "Si en Facebook detecto que a una persona de mi red le están haciendo la vida imposible, qué hago:"
                    static let correcta = "A"
                    static let consejo = "Nunca te calles ante una situación como esta, intenta mediar con los abusones para que paren con su comportamiento, pero nunca entres en nuevas peleas. Toda red social permite denunciar malos comportamientos, y si fuese necesario siempre puedes dar aviso a la policía."

                    struct RespuestaA {
                        static let respuesta = "a) Intentar mediar para evitarlo y, si es necesario, denunciar el caso."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) No hacer caso."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Seguir con las bromas."
                    }
                }
                
                enum Pregunta7 {
                    static let Pregunta = "Si en Facebook u otra red social, recibo una solicitud de amistad de una persona que no conozco, qué debo hacer:"
                    static let consejo = "Si no conoces a esa persona en la realidad nunca aceptes su invitación, pero ser una cuenta falsa para averiguar información sobre tí"
                    static let correcta = "A"
                    struct RespuestaA {
                        static let respuesta = "a) No aceptarla, denunciarlo a Facebook y comentarlo con mis padres."
                    }
                    struct RespuestaB {
                        static let respuesta = "b)  Aceptarla: puede que merezca la pena."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Aceptarla si es amig@ de mis amig@s, aunque yo no la conozca."
                    }
                }
            }
        }
        struct Categoria4 {
            static var numeroIntentos = 0
            static var historico = ["","","","",""]
            static var Nombre = "Uso del Terminal"
            static var Finalizada = "False"
            struct Preguntas {
                enum Pregunta1 {
                    static let Pregunta = "Respecto al uso del móvil, señala la respuesta que más te convenza:"
                    static let correcta = "A"
                    static let consejo = "Disfruta de las conversaciones cara y cara con tus amigos o familiares. El móvil es solo una forma más de relacionarse, no la única"

                    struct RespuestaA {
                        static let respuesta = "a) Debo tener cuidado e intentar que no afecte a mi relación con mis amigos."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Debo dedicarle todas las horas que pueda, ya que va a ser una herramienta indispensable en mi futuro profesional."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Lo mejor es no utilizar el móvil, ya que es una tecnología muy adictiva."
                    }
                }
                
                struct Pregunta2 {
                    static let Pregunta = "Imagina la siguiente situación: estás cenando con tus padres y los dos se dedican a mirar el teléfono móvil mientras comen. ¿Qué harías?"
                    static let correcta = "B"
                    static let consejo = "Disfruta de las conversaciones cara y cara con tus amigos o familiares. El móvil es solo una forma más de relacionarse, no la única"

                    struct RespuestaB {
                        static let respuesta = "b) Les propondría como un juego que prohibiésemos el uso del móvil en la cena."
                    }
                    struct RespuestaA {
                        static let respuesta = "a)  Aprovecharía para mirar mis redes sociales, chatear o subir alguna foto a Instagram."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Me pondría a mirar el móvil como ellos."
                    }
                }
                
                enum Pregunta3 {
                    static let Pregunta = " Cargadores USB en transporte y sitios públicos:"
                    static let correcta = "A"
                    static let consejo = "Cuando se trata del uso de USB públicos, no tienen porqué estar corrompidos. Pero siempre será más seguro tirar de nuestra propia batería externa o recurrir a un cable USB que no disponga de las parte que son necesarias para transmitir datos , es decir, que sólo cargue."

                    struct RespuestaA {
                        static let respuesta = "a)  No lo uso pueden adquirir datos sin saberlo."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) No lo uso porque no me apetece llevar mi cable."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Lo utilizo sin miedo, ¿qué podría pasar?."
                    }
                }
                
                
                enum Pregunta4 {
                    static let Pregunta = " Acabas de instalar un juego nuevo, el cual te gusta mucho. Mañana tienes examen, pero te gustaría superar el record de tu amigo."
                    static let correcta = "C"
                    static let consejo = "Los juegos están bien como entretenimiento cuando tenemos tiempo libre. Sin embargo, en momentos de exámenes, no deberíamos prestarles tanta atención."

                    struct RespuestaC {
                        static let respuesta = "c) Quizás sea mejor dejarlo por hoy, el examen es lo más importante."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Bueno, jugaré un poco más… Media hora de estudio menos tampoco va a influir demasiado."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) No pienso parar hasta superar su record…"
                    }
                }
                
                enum Pregunta5 {
                    static let Pregunta = "Te vas de viaje a Londres. Llegas al aeropuerto con mucha antelación y te aburres.. Quieres conectarte a internet pero te quedan pocos megas de tu tarifa de datos. Ves que hay un WIFI público"
                    static let correcta = "C"
                    static let consejo = "Las WIFIS públicas son peligrosas, ya que cualquiera puede espiar todo el tráfico que circula por ellas. Además, podrían también infectarte con virus. Es aconsejable evitarlas en la medida de lo posible y no mandar nunca datos personales."

                    struct RespuestaC {
                        static let respuesta = "c) Si puedo evitarlo, no me conecto."
                    }
                    struct RespuestaB {
                        static let respuesta = "b)  Me conecto como si fuese el WIFI de mi casa. ¿Qué diferencia iba a haber?"
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Me conecto sin dudarlo, así las fotos de Instagram me cargan mucho más rápido"
                    }
                }
                
                enum Pregunta6 {
                    static let Pregunta = "Ves una pelea en la calle. ¿Qué haces?"
                    static let correcta = "A"
                    static let consejo = "Hay que tener cuidado con los contenidos que se suben a las redes sociales o se difunden por internet. Dichas redes son para subir contenido de ocio no para fomentar la violencia."

                    struct RespuestaA {
                        static let respuesta = "a) Si ves que la situación va a peor, utilizar el teléfono para llamar a las autoridades pertinentes."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Saco el móvil y lo grabo todo. Sin duda a mis amigos les encantará verlo luego."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Lo grabo y lo subo a redes sociales.Aumentará mi popularidad."
                    }
                }
                
                enum Pregunta7 {
                    static let Pregunta = "Además de tener una contraseña distinta para cada servicio y construida de forma compleja, debo tener en cuenta que mi contraseña debe ser…"
                    static let correcta = "A"
                    static let consejo = "Aqui va el consejo"

                    struct RespuestaA {
                        static let respuesta = "a) Fácil de recordar por mí y difícil de adivinar para los demás"
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Tiene que ser muy chula y divertida"
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Mis contraseñas no son importantes"
                    }
                }
            }
        }
        struct Categoria5 {
            static var numeroIntentos = 0
            static var historico = ["","","","",""]
            static var Nombre = "Uso de Internet"
            static var Finalizada = "False"
            struct Preguntas {
                enum Pregunta1 {
                    static let Pregunta = "Si al entrar en una Web, veo la alerta “Este sitio no es seguro”:"
                    static let correcta = "A"
                    static let consejo = "Cuando entramos a una web y vemos el aviso, no tiene por qué ser un sitio malicioso. Puede que sólo sea una web antigua (EJ: Web intranet del Colegio), y por eso lo mejor es preguntar e informarse."

                    struct RespuestaA {
                        static let respuesta = "a) Debo tener cuidado e informarme de si es la web correcta en la quiero entrar."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) No le hago caso y entro sin pensar."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) No entro y punto."
                    }
                }
                
                struct Pregunta2 {
                    static let Pregunta = "Imagina la siguiente situación: para gustar a una persona, decides entrar en un blog de cómo adelgazar/ muscular:"
                    static let correcta = "A"
                    static let consejo = " Internet es un mundo gigante, en el que hay muchas cosas ciertas pero tambien muchas erróneas y distorsionadas. Nunca creas al 100% lo que leas en internet, sigue informándote en otros sitios y con especialistas fuera de la red."

                    struct RespuestaA {
                        static let respuesta = "a) Consulto lo que he leído con mis mayores o algún especialista."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Hago caso a todo lo que se habla y se dice en este blog."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Hago migas con los usuarios de este blog y solo les hago caso a ellos."
                    }
                }
                
                enum Pregunta3 {
                    static let Pregunta = "Necesitas buscar información en Internet sobre un determinado tema"
                    static let correcta = "B"
                    static let consejo = "Internet es muy útil para obtener información sobre cualquier tema. Pero es importante no quedarse solo con la primera información que veamos, sino visitar distintos sitios y contrastar informaciones."

                    struct RespuestaB {
                        static let respuesta = "b) Busco información en distintas páginas web fiables y contrasto informaciones."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Utilizo un buscador y accedo a la primera web que me aparezca."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) En internet hay muchos bulos, yo ahí paso de buscar información sobre nada."
                    }
                }
                
                
                enum Pregunta4 {
                    static let Pregunta = " De las tres opciones siguientes, marca la opción más correcta en cuanto a conocer a tus amigos de internet:"
                    static let correcta = "C"
                    static let consejo = "Lo mejor es ir acompañado de un mayor porque nunca sabemos cómo es ese amigo online. Si no puedes ir acompañado, queda en sitios en los que haya siempre mucha gente para estar seguro."

                    struct RespuestaC {
                        static let respuesta = "c) Quedamos en un sitio con gente alrededor y si puedo voy acompañado de un mayor."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Quedamos en su sitio tranquilo y alejado para poder hablar tranquilamente."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Les doy la dirección de mi casa, aprovechando que mis padres saldrán fuera esa tarde."
                    }
                }
                
                enum Pregunta5 {
                    static let Pregunta = "Hago un nuevo amigo jugando un juego online..."
                    static let correcta = "A"
                    static let consejo = "Nunca concedas información sobre ti a un desconocido. Primero conoce en persona al amigo online, y tras esto empieza una auténtica amistad con él o ella."

                    struct RespuestaA {
                        static let respuesta = "a) Utilizo un avatar."
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Le cuento cosas personales para conocernos mejor."
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Le doy mi correo y mi teléfono para mantener el contacto."
                    }
                }
                
                enum Pregunta6 {
                    static let Pregunta = "Llevo jugando online desde las 9:00 de la mañana y a las 16:00 me llama un amigo/a para ir a la playa …"
                    static let correcta = "B"
                    static let consejo = "Disfruta con tus amigos, no dejes que internet te aleje de ellos."

                    struct RespuestaB {
                        static let respuesta = "b) Me pongo el bañador y me voy con él/ella."
                    }
                    struct RespuestaA {
                        static let respuesta = "a) Le digo que no, prefiero quedarme en casa jugando."
                    }
                    struct RespuestaC {
                        static let respuesta = "c)  Le digo que se quede conmigo jugando, hace mucho calor en la playa."
                    }
                }
                
                enum Pregunta7 {
                    static let Pregunta = "Además de tener una contraseña distinta para cada servicio y construida de forma compleja, debo tener en cuenta que mi contraseña debe ser…"
                    static let correcta = "A"
                    static let consejo = "Aqui va el consejo"

                    struct RespuestaA {
                        static let respuesta = "a) Fácil de recordar por mí y difícil de adivinar para los demás"
                    }
                    struct RespuestaB {
                        static let respuesta = "b) Tiene que ser muy chula y divertida"
                    }
                    struct RespuestaC {
                        static let respuesta = "c) Mis contraseñas no son importantes"
                    }
                }
            }
        }
    }



