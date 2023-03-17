/*simplemente me permite actualizar la contraseña
y guardarla con un valor de blob encriptado con una llave de seguridad
 */

/*encriptar contraseña*/
delimiter //
create procedure encriptar(in id int, in ncontrasena varchar(45))
begin
	update Usuario set contrasena = hex(aes_encrypt(ncontrasena, "will1"))  
	where id_usuario=id;
end;

/*desencriptar contraseña*/
delimiter //
create procedure desencriptar(in id int, in claveR varchar(45))
begin
	update Usuario set contrasena = aes_decrypt(unhex(contrasena), claveR) 
	where id_usuario=id; 
end;

call encriptar(2,'2345');
call desencriptar(1,'will1');