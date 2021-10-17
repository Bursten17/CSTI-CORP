USE CSTI_CORP
GO

CREATE PROCEDURE USP_GET_PEDIDOS
@P_estado INT
AS
BEGIN
	SELECT
			id
			,idCliente
			,nombreCliente
			,fechaPedido
			,observacion
			,total
			,estado
	FROM
			TB_PEDIDO
	WHERE 
			estado = @P_estado
END
GO


CREATE PROCEDURE USP_GET_PEDIDO_POR_ID
@P_id INT
AS
BEGIN
	SELECT
			id
			,idCliente
			,nombreCliente
			,fechaPedido
			,observacion
			,total
			,estado
	FROM
			TB_PEDIDO
	WHERE
		id = @P_id AND
		estado = 1
END
GO

CREATE PROCEDURE USP_CREATE_PEDIDO
@P_idCliente INT
,@P_nombreCliente VARCHAR(100)
,@P_observacion VARCHAR(500)
,@P_total DECIMAL(10, 2)
AS
BEGIN
	INSERT INTO 
				TB_PEDIDO(
						idCliente
						,nombreCliente
						,fechaPedido
						,observacion
						,total
						,estado
						)
				VALUES	(
						@P_idCliente,
						@P_nombreCliente,
						GETDATE(),
						@P_observacion,
						@P_total,
						1
						)
END
GO

CREATE PROCEDURE USP_UPDATE_PEDIDO
@P_id INT
,@P_observacion VARCHAR(500)
,@P_total DECIMAL(10, 2)
AS
BEGIN
	UPDATE TB_PEDIDO
    SET    
            observacion = @P_observacion
			,total = @P_total
    WHERE  id = @P_id
END
GO

CREATE PROCEDURE USP_DELETE_PEDIDO
@P_id INT
AS
BEGIN
	UPDATE TB_PEDIDO
    SET   
			estado = 0
    WHERE  id = @P_id
END
GO

CREATE PROCEDURE USP_GET_PROVEEDORES
AS
BEGIN
	SELECT
			id
			,nombre
	FROM
			TB_CLIENTE
	WHERE 
			estado = 1
END
GO
