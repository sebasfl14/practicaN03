<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h1>Registra cliente</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registracliente" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_apellido"> apellido</label>
				<input class="form-control" id="id_apellido" name="apellido" placeholder="Ingrese el apellido" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_fechaNacimiento"> fechaNacimiento</label>
				<input class="form-control" id="id_fechaNacimiento" name="fechaNacimiento" placeholder="Ingrese la fecha Nacimiento" type="date" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_telefono">telefono</label>
				<input class="form-control" id="id_telefono" name="telefono" placeholder="Ingrese el telefono" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_email">email</label>
				<input class="form-control" id="id_email" name="email" placeholder="Ingrese el email" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_direccion">direccion</label>
				<input class="form-control" id="id_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="2"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_categoria">categoria</label>
				<select id="id_categoria" name="categoria.idcategoria" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargacategoria", {}, function(data){
	$.each(data, function(index,item){
		$("#id_categoria").append("<option value="+item.idcategoria +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
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
        apellido: {
    		selector : '#id_apellido',
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
        fechaNacimiento: {
    		selector : '#id_fechaNacimiento',
            validators: {
            	notEmpty: {
                    message: 'La fecha Nacimiento es un campo obligatorio'
                },
                stringLength :{
                	message:'La fecha Nacimiento es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        telefono: {
    		selector : '#id_telefono',
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
        email: {
    		selector : '#id_email',
            validators: {
            	notEmpty: {
                    message: 'El email es un campo obligatorio'
                },
                stringLength :{
                	message:'El email es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        direccion: {
    		selector : '#id_direccion',
            validators: {
            	notEmpty: {
                    message: 'La direccion es un campo obligatorio'
                },
                stringLength :{
                	message:'El email es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                }
            }
        },
        categoria: {
    		selector : '#id_categoria',
            validators: {
            	notEmpty: {
                    message: 'La categoria un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




