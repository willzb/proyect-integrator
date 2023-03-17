/*se crean las tablas*/

CREATE TABLE paises(
    id_paises int PRIMARY KEY not null auto_increment,
    nombrePaises VARCHAR(50)
);

CREATE TABLE ciudad(
    id_ciudad int PRIMARY KEY not null auto_increment,
    nombreCiudad VARCHAR(80),
    id_Paises int not null
);

CREATE TABLE usuario(
    id_usuario int PRIMARY KEY not null auto_increment,
    primerNombre VARCHAR(50),
    segundoNombre VARCHAR(50) NULL,
    primerApellido VARCHAR(50),
    segundoApellido VARCHAR(50),
    correoElectronico VARCHAR(150),
    numeroTelefono VARCHAR(15) NULL,
    id_ciudadResidencia int,
    contrasena text
);

CREATE TABLE tipoFollower(
    id_follower int PRIMARY KEY not null auto_increment,
    nombreAbreviado VARCHAR(50),
    nombreCompleto VARCHAR(50)
);

CREATE TABLE canalSTR(
    id_canalstr INT PRIMARY KEY NOT NULL auto_increment,
    id_usuario int,
    id_pagina int,
    nombreCanal VARCHAR(100),
    id_fechatransmision int
);

CREATE TABLE canal_follower(
    id_follower int PRIMARY KEY NOT NULL auto_increment,
    Id_tiposeguidor int,
    id_usuario int,
    id_canalstr int 
);

CREATE TABLE pagina(
    id_pagina INT PRIMARY KEY NOT NULL auto_increment,
    nombrePagina VARCHAR(100),
    precio double 
);

CREATE TABLE fecha_transmision(
    id_fechatransmision INT PRIMARY KEY NOT null auto_increment,
    fecha DATETIME
);

/*se crean las relaciones*/

ALTER TABLE ciudad
ADD CONSTRAINT fk_ciudadPaises
  FOREIGN KEY (id_paises)
  REFERENCES paises (id_paises);

ALTER TABLE usuario
ADD CONSTRAINT fk_ciudadresidencia
  FOREIGN KEY (id_ciudadResidencia)
  REFERENCES ciudad (id_ciudad);

ALTER TABLE canal_follower
ADD CONSTRAINT fk_tipoSeguidor
  FOREIGN KEY (Id_tiposeguidor)
  REFERENCES tipoFollower (id_follower);

ALTER TABLE canal_follower
ADD CONSTRAINT fk_idusuario
  FOREIGN KEY (id_usuario)
  REFERENCES Usuario (id_usuario);

ALTER TABLE canal_follower
ADD CONSTRAINT fk_canal_Stream
  FOREIGN KEY (id_canalstr)
  REFERENCES CanalSTR (id_canalstr);

ALTER TABLE canalSTR
ADD CONSTRAINT fk_idusuariocanal
  FOREIGN KEY (id_usuario)
  REFERENCES Usuario (id_usuario);

ALTER TABLE canalSTR
ADD CONSTRAINT fk_canal_pagina
  FOREIGN KEY (id_pagina)
  REFERENCES Pagina (id_pagina);

ALTER TABLE canalSTR
ADD CONSTRAINT fk_canal_fecha
  FOREIGN KEY (id_fechatransmision)
  REFERENCES fecha_transmision (id_fechatransmision);

/*
DELIMITER //
CREATE FUNCTION insertar() RETURNS varCHAR(30)
BEGIN
    RETURN 'HolaMundo';
END //
*/

    
/*se insertan datos*/
insert into paises(nombrePaises) values ("Colombia");
insert into paises(nombrePaises) values ("Corea del Norte");
insert into paises(nombrePaises) values ("Costa Rica");
insert into paises(nombrePaises) values ("Cuba");
insert into paises(nombrePaises) values ("Dinamarca");
insert into paises(nombrePaises) values ("Ecuador");
insert into paises(nombrePaises) values ("España");
insert into paises(nombrePaises) values ("Estados Unidos");
insert into paises(nombrePaises) values ("Francia");
insert into paises(nombrePaises) values ("Guatemala");
insert into paises(nombrePaises) values ("Haití");
insert into paises(nombrePaises) values ("Irán");
insert into paises(nombrePaises) values ("Japón");
insert into paises(nombrePaises) values ("Luxemburgo");
insert into paises(nombrePaises) values ("Madagascar");
insert into paises(nombrePaises) values ("México");



insert into ciudad(nombreCiudad,id_Paises) value("Bogotá",1);
insert into ciudad(nombreCiudad,id_Paises) value("Pionyang",2);
insert into ciudad(nombreCiudad,id_Paises) value("San José",3);
insert into ciudad(nombreCiudad,id_Paises) value("La Habana",4);
insert into ciudad(nombreCiudad,id_Paises) value("Copenhague",5);
insert into ciudad(nombreCiudad,id_Paises) value("Quito",6);
insert into ciudad(nombreCiudad,id_Paises) value("Madrid",7);
insert into ciudad(nombreCiudad,id_Paises) value("Washington D. C.",8);
insert into ciudad(nombreCiudad,id_Paises) value("París",9);
insert into ciudad(nombreCiudad,id_Paises) value("Guatemala",10);
insert into ciudad(nombreCiudad,id_Paises) value("Puerto Príncipe",11);
insert into ciudad(nombreCiudad,id_Paises) value("Teherán",12);
insert into ciudad(nombreCiudad,id_Paises) value("Tokio",13);
insert into ciudad(nombreCiudad,id_Paises) value("Luxemburgo",14);
insert into ciudad(nombreCiudad,id_Paises) value("Antananarivo",15);
insert into ciudad(nombreCiudad,id_Paises) value("México",16);


insert into Usuario(primerNombre,segundoNombre,primerApellido,SegundoApellido,correoElectronico,numeroTelefono,id_ciudadResidencia,contrasena)
    values ("jose",null,"savedra","gomez","savedraj@gmail.com",3214532452,5,null);
    
insert into Usuario(primerNombre,segundoNombre,primerApellido,SegundoApellido,correoElectronico,numeroTelefono,id_ciudadResidencia,contrasena)
    values ("josue","estevan","souza","fernandez","estevanf11@gmail.com",3678906541,4,null);
    
insert into Usuario(primerNombre,segundoNombre,primerApellido,SegundoApellido,correoElectronico,numeroTelefono,id_ciudadResidencia,contrasena)
    values ("fabian",null,"gimenes","lopez","lopezfabi23@gmail.com",3001456732,6,null);

insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('P','pacifico');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('Au','al uso');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('B','buscador de ofertas');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('Ci','cliente insatisfecho');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('A','animadores');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('troll','proteston');
insert into tipoFollower(nombreAbreviado,nombreCompleto) value ('I','incondisionales');


insert into pagina(nombrePagina,precio) value ('pagina de prueba',0);
insert into pagina(nombrePagina,precio) value ('pagina oficial',35900);
insert into pagina(nombrePagina,precio) value ('pagina SSTR',59000);

insert into canalSTR(id_usuario,id_pagina,nombreCanal,id_fechatransmision) 
value (1,2,'fornite',null);
insert into canalSTR(id_usuario,id_pagina,nombreCanal,id_fechatransmision) 
value (2,2,'pacifista',null);

insert into canal_follower(id_tiposeguidor,id_usuario,id_canalstr) value(6,2,2);
