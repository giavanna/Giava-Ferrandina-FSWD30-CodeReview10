<?php

 ob_start();

 session_start(); // start a new session or continues the previous

 if( isset($_SESSION['user'])!="" ){ //isset verifica se una variabile ha un valore o meno

  header("Location: home.php"); // redirects to home.php

 }

 include_once 'dbconnect.php'; // mi include nello script lo script dbconnect.php


 $error = false;

 
 if ( isset($_POST['btn-signup']) ) {

 

  // sanitize user input to prevent sql injection
  $name = trim($_POST['name']); //trim: cancella gli spazi vuoti all'inizio e alla fine

  $name = strip_tags($name); //strip: taglia tutti i caratteri riservati di html ed php per evitare che lo prenda come codice

  $name = htmlspecialchars($name);//htmlspecialchars: converte i caratteri speciali in codifica html esempio Ö...

 

  $email = trim($_POST['email']);

  $email = strip_tags($email);

  $email = htmlspecialchars($email);

 

  $pass = trim($_POST['pass']);

  $pass = strip_tags($pass);

  $pass = htmlspecialchars($pass);

 

  // basic name validation
  if (empty($name)) {

   $error = true;

   $nameError = "Please enter your full name.";

  } else if (strlen($name) < 3) {

   $error = true;

   $nameError = "Name must have atleat 3 characters.";

  } else if (!preg_match("/^[a-zA-Z ]+$/",$name)) { //preg_match: se utilizzo lettere alfabetiche per il nome mi da l'errore di sotto..

   $error = true;

   $nameError = "Name must contain alphabets and space.";

  }

  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) { // controlla se ho inserito una stringa equivalente ad un indirizzo email

   $error = true;

   $emailError = "Please enter valid email address.";

  } else {

   // check whether the email exist or not
   $query = "SELECT userEmail FROM users WHERE userEmail='$email'";// controlla se l'indirizzo mail che ho messo è gia esistente ed in tal caso mi da errore

   $result = mysqli_query($conn, $query);

   $count = mysqli_num_rows($result);

   if($count!=0){

    $error = true;

    $emailError = "Provided Email is already in use.";

   }

  }

  // password validation
  if (empty($pass)){

   $error = true;

   $passError = "Please enter password.";

  } else if(strlen($pass) < 6) { //strlen:string.langht

   $error = true;

   $passError = "Password must have atleast 6 characters.";

  } else if ( !filter_var($pass,FILTER_VALIDATE_REGEXP, array("options"=>array("regexp"=>"/^(?=.*[^A-Za-z\d])/"))) ) { //controlla se ho messo anche dei caratteri speciali all'interno della password

   $error = true;

   $emailError = "Please enter passwd with special characters";
  }
  
  // password encrypt using SHA256();
  $password = hash('sha256', $pass); // hash:trasforma la password in un codice di numeri per motivi di sicurezza(guarda dentro database)

 
  // if there's no error, continue to signup
  if( !$error ) {


   $query = "INSERT INTO users(userName,userEmail,userPass) VALUES('$name','$email','$password')";

   $res = mysqli_query($conn, $query);

   
   if ($res) {

    $errTyp = "success";

    $errMSG = "Successfully registered, you may login now";

    unset($name); //unset: azzerare, sisattivare, disinserito per evitare che il prossimo user possa vedere i tuoi dati

    unset($email);

    unset($pass);

   } else {

    $errTyp = "danger";

    $errMSG = "Something went wrong, try again later...";

   }
  }
 }

?>

<!DOCTYPE html>

<html>

<head>

<title>Login & Registration System</title>

</head>

<body>

    <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off"><!--rimanda i dati al file php attualmente in uso quindi questo stesso-->

             <h2>Sign Up.</h2>

             <hr />

            <?php

   if ( isset($errMSG) ) { //isset: impostato, destinato, predefinito, fissato
    ?>
        <div class="alert">

 <?php echo $errMSG; ?>

             </div>
<?php

   }
 ?>
             <input type="text" name="name" class="form-control" placeholder="Enter Name" maxlength="50" value="<?php echo $name ?>" />

                <span class="text-danger"><?php echo $nameError; ?></span>


             <input type="email" name="email" class="form-control" placeholder="Enter Your Email" maxlength="40" value="<?php echo $email ?>" />

                <span class="text-danger"><?php echo $emailError; ?></span>

       
             <input type="password" name="pass" class="form-control" placeholder="Enter Password" maxlength="15" />

                <span class="text-danger"><?php echo $passError; ?></span>

             <hr />


             <button type="submit" class="btn btn-block btn-primary" name="btn-signup">Sign Up</button>

             <hr />


             <a href="index.php">Sign in Here...</a>
  </form>

</body>

</html>

<?php ob_end_flush(); ?>