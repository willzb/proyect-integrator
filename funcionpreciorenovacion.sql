drop function if exists consultarpaginas;
DELIMITER //
/* me permite calcular el precio de la renovacion de la pagina depeendiendo del precio que este manejando hasta el momento*/

CREATE FUNCTION consultarpaginas(precio double , renovacion double) returns double
BEGIN 
	declare precio1 double default 0;
    set precio1 = renovacion + precio;
    
        return precio1;

end//

select *, consultarpaginas(precio,1200) as precio from pagina;