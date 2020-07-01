<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>

<body> 
<div class="container">
 <h2>Consulta del cliente</h2>
		 <div class="col-md-23" >  
		       <form accept-charset="UTF-8"  action="consultacliente" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
								<select id="id_categoria" name="idcategoria" class='form-control'>
										<option value=" "> [ Seleccione categoria ]</option>    
								</select>
						</div>
						<div class="col-md-3">
								<input class="form-control" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" type="text"/>
						</div>
						
						<div class="col-md-3">
								<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tablecliente" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Apellido</th>
												<th>FechaNacimiento</th>
												<th>Telefono</th>
												<th>Email</th>
												<th>Direccion</th>
												<th>Categoria</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${clientes}" var="x">
													<tr>
														<td>${x.idcliente}</td>
														<td>${x.nombre}</td>
														<td>${x.apellido}</td>
														<td>${x.fechaNacimiento}</td>
														<td>${x.telefono}</td>
														<td>${x.email}</td>
														<td>${x.direccion}</td>
														<td>${x.categoria.nombre}</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
 </div>

<script type="text/javascript">
$.getJSON("cargacategoria", {}, function(data){
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.idcategoria +">"+ item.nombre +"</option>");
	});
});
</script>
    
</body>
</html> 