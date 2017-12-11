
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Particule Simulator | Emitter </title>


  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

		<?php require("./bdd.php"); ?>

		<?php 

			$emitter = null;

			if(isset($_GET['id'])){
				$sth = $bdd->prepare("SELECT * FROM particules WHERE id = ?");
				$sth->execute(array($_GET['id']));
				$emitter = $sth->fetch();
				$datas = json_decode($emitter["datas"]);
			}


		?>

	<div id="fh5co-page">

		<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
		<aside id="fh5co-aside" role="complementary" class="border">

			<h1 id="fh5co-logo"><a href="index.php"><img src="images/logo-colored.png" alt="Free HTML5 Bootstrap Website Template"></a></h1>
			<nav id="fh5co-main-menu" role="navigation">
				<ul>
					<li><a href="index.php">Accueil</a></li>
					<li><a href="gallery.php">Galeries</a></li>
					<li><a href="contact.php">Contact</a></li>
				</ul>
			</nav>
		</aside>

		<div id="fh5co-main">

			<?php if($emitter != null){ 

				?>


		
				<div class="fh5co-narrow-content animate-box fh5co-border-bottom" data-animate-effect="fadeInLeft">
					<h2 class="fh5co-heading" ><?= $emitter['nom']; ?></span></h2>
					<p>Pour obtenir le même resultat, appliquez les mêmes configurations sur votre application.</p>
						<hr>

						<p class="configInfo"><span class="configIndex">Emitter Birthrate</span> : <span class="configValue"><?= ceil($datas->EMITTER_BIRTHRATE) ?></span></p>
						<p class="configInfo"><span class="configIndex">Position Range X</span> : <span class="configValue"><?= ceil($datas->POSITION_RANGE_X) ?></span></p>
						<p class="configInfo"><span class="configIndex">Position Range Y</span> : <span class="configValue"><?= ceil($datas->POSITION_RANGE_Y) ?></span></p>
						<p class="configInfo"><span class="configIndex">Angle Start</span> : <span class="configValue"><?= ceil(rad2deg($datas->ANGLE_START))."°" ?></span></p>
						<p class="configInfo"><span class="configIndex">Angle Range</span> : <span class="configValue"><?= ceil(rad2deg($datas->ANGLE_RANGE))."°" ?></span></p>
						<p class="configInfo"><span class="configIndex">Speed Start</span> : <span class="configValue"><?= ceil($datas->SPEED_START) ?></span></p>
						<p class="configInfo"><span class="configIndex">Speed Range</span> : <span class="configValue"><?= ceil($datas->SPEED_RANGE) ?></span></p>
						<p class="configInfo"><span class="configIndex">Acceleration X</span> : <span class="configValue"><?= ceil($datas->ACCELERATION_X) ?></span></p>
						<p class="configInfo"><span class="configIndex">Acceleration Y</span> : <span class="configValue"><?= ceil($datas->ACCELERATION_Y) ?></span></p>
						<p class="configInfo"><span class="configIndex">Alpha Start</span> : <span class="configValue"><?= ceil($datas->ALPHA_START) ?></span></p>
						<p class="configInfo"><span class="configIndex">Alpha Range</span> : <span class="configValue"><?= ceil($datas->ALPHA_RANGE) ?></span></p>
						<p class="configInfo"><span class="configIndex">Alpha Speed</span> : <span class="configValue"><?= ceil($datas->ALPHA_SPEED) ?></span></p>
						<p class="configInfo"><span class="configIndex">Scale Start</span> : <span class="configValue"><?= ceil($datas->SCALE_START) ?></span></p>
						<p class="configInfo"><span class="configIndex">Scale Range</span> : <span class="configValue"><?= ceil($datas->SCALE_RANGE) ?></span></p>
						<p class="configInfo"><span class="configIndex">Scale Speed</span> : <span class="configValue"><?= ceil($datas->SCALE_SPEED) ?></span></p>
						<p class="configInfo"><span class="configIndex">Rotation Start</span> : <span class="configValue"><?= ceil(rad2deg($datas->ROTATION_START))."°" ?></span></p>
						<p class="configInfo"><span class="configIndex">Rotation Range</span> : <span class="configValue"><?= ceil(rad2deg($datas->ROTATION_RANGE))."°" ?></span></p>
						<p class="configInfo"><span class="configIndex">Rotation Speed</span> : <span class="configValue"><?= ceil(rad2deg($datas->ROTATION_SPEED))."°" ?></span></p>


				</div>

			<?php } else{ ?>

				<div class="fh5co-narrow-content animate-box fh5co-border-bottom" data-animate-effect="fadeInLeft">
					<h2 class="fh5co-heading" >Générateur introuvable</span></h2>
					<p>Le générateur que vous recherchez est introuvable.</p>
					<p>Merci de retourner sur la <a href="./gallery.php">galerie</a> et d'en selectionner un nouveau</p>
				</div>

			<?php } ?>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Stellar -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Counters -->
	<script src="js/jquery.countTo.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="js/main.js"></script>

	</body>
</html>

