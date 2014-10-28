<div id="skeleton_body">
<?php  if (isset($formOpen)):?>
<?php echo "<h1>Saludar al usuario</h1>"; ?>
<?php echo $formOpen;?><br />
<?php echo $label1; ?>
<?php echo $input1; ?>
<?php echo $label2; ?>
<?php echo $input2; ?><br />
<?php echo $submit; ?>
<?php echo $formClose ?><br />
<hr />
<?php if(isset($button)) :?>
	<table border="2px" style="background-color:#00FF00">
				<tr>
					<td>
        <?php if(isset($name) && isset($lastname)) : ?>
			<?php if(($name!="")&&($lastname!="")) :?>
                  <h2>Hola <u><?=$name?></u> tu apellido es <u><?=$lastname?></u></h2>
            <?php endif ?>
 		<?php endif ?>
  		<?php if(isset($error)) :?>
  				<?php  echo $error;?>

		<?php endif ?>
							</td>
				</tr>
			</table>
<?php endif ?>

<?php else: ?>
<h1>Hay que editar todo el body</h1>
<?php endif ?>




</div>

