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
 <h1>Crud de cliente</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudcliente">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudcliente" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
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
												   
												<c:forEach items="${cliente}" var="x">
													<tr>
														<td>${x.idcliente}</td>
														<td>${x.nombre}</td>
														<td>${x.Apellido}</td>
														<td>${x.FechaNacimiento}</td>
														<td>${x.Telefono}</td>
														<td>${x.Email}</td>
														<td>${x.Direccion}</td>
														<td>${x.Categoria.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idcliente}','${x.nombre}','${x.Apellido}','${x.FechaNacimiento}','${x.Telefono}','${x.Email}','${x.Direccion}','${x.Categoria.idcategoria}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idcliente}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro del cliente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudcliente" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del cliente</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido">apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apellido" name="apellido" placeholder="Ingrese el apellido" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_mujeres" name="fechaNacimiento" placeholder="Ingrese la fecha Nacimiento" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese al telefono" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el email" type="text" maxlength="2"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_categoria" name="categoria.idcategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza cliente</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudcliente" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de cliente</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idcliente" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_apellido">apellido</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apellido" name="apellido" placeholder="Ingrese el apellido" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_fechaNacimiento">fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha Nacimiento" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_telefono">telefono</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el telefono" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_email">email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_email" name="email" placeholder="Ingrese el email" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>  
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_direccion">direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="2"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_act_categoria" name="categoria.idcategoria" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargacategoria", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_categoria").append("<option value="+item.idcategoria +">"+ item.nombre +"</option>");
		$("#id_act_categoria").append("<option value="+item.idcategoria +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,apellido,fechaNacimiento,telefono, email, direccion, idcategoria){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_apellido]').val(apellido);
	$('input[id=id_act_fechaNacimiento]').val(fechaNacimiento);
	$('input[id=id_act_telefono]').val(telefono);
	$('input[id=id_act_email]').val(email);
	$('input[id=id_act_direccion]').val(direccion);
	$('select[id=id_act_categoria]').val(idcategoria);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablecliente').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "apellido": {
        		selector : '#id_reg_apellido',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_reg_fechaNacimiento',
                validators: {
                	notEmpty: {
                        message: 'la fecha Nacimiento es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'la fecha Nacimiento es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "telefono": {
        		selector : '#id_reg_telefono',
                validators: {
                	notEmpty: {
                        message: 'El telefono es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El telefono es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "email": {
        		selector : '#id_reg_email',
                validators: {
                	notEmpty: {
                        message: 'El email es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El email es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "direccion": {
        		selector : '#id_reg_direccion',
                validators: {
                	notEmpty: {
                        message: 'la direccion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'la direccion es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "categoria.idcategoria": {
        		selector : '#id_reg_categoria',
                validators: {
                	notEmpty: {
                        message: 'la categoria un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>

<script type="text/javascript">
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "apellido": {
        		selector : '#id_reg_apellido',
                validators: {
                    notEmpty: {
                        message: 'El apellido es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_reg_fechaNacimiento',
                validators: {
                	notEmpty: {
                        message: 'la fecha Nacimiento es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'la fecha Nacimiento es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "telefono": {
        		selector : '#id_reg_telefono',
                validators: {
                	notEmpty: {
                        message: 'El telefono es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El telefono es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "email": {
        		selector : '#id_reg_email',
                validators: {
                	notEmpty: {
                        message: 'El email es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El email es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "direccion": {
        		selector : '#id_reg_direccion',
                validators: {
                	notEmpty: {
                        message: 'la direccion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'la direccion es de 5 a 10 caracteres',
                    	min : 5,
                    	max : 10
                    }
                }
            },
            "categoria.idcategoria": {
        		selector : '#id_act_categoria',
                validators: {
                	notEmpty: {
                        message: 'la categoria un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 