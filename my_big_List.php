<?php

 ob_start();

 session_start();

 require_once 'dbconnect.php';

 // if session is not set this will redirect to login page

 if( !isset($_SESSION['user']) ) {
	header("Location: index.php");
	exit;
 }

 // select logged-in users detail

	$res=mysqli_query($conn, "SELECT * FROM users WHERE userId=".$_SESSION['user']);

	$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);

?>

<!DOCTYPE html>
<html>
	<head>
		<title>Big list media</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
		<link rel="stylesheet" href="./css/library.css">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script>   
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
		<container class="row">
			<img src="img/library.png" style="width: 100%; height:350px; position: fixed-top">
		</container>
		<h1 style="text-align: center; font-size: 3em">Enjoy Our Media</h1>
		<h3 style="text-align: center;">
			Welcome <?php echo $userRow['userName']; ?> (<a class="logout" href="logout.php?logout">Logout</a>)
		</h3>
		

		<?php
			$servername ="localhost";
			$username = "root";
			$password = "";
			$dbname = "cr10_giava_ferrandina_biglibrary";

			$mysqli = mysqli_connect($servername, $username, $password, $dbname);
			if (!$mysqli) {
	       		echo "DB connection failed!!!";
	    	}

			$sql = "SELECT m.media_isbn, m.media_title, m.media_publish_date, m.media_description, m.media_img,
							a.author_first_name, a.author_last_name,
							p.publisher_name, p.publisher_address, p.publisher_size,
							mt.media_type
					FROM media m
					INNER JOIN author a ON m.fk_author_id = a.author_id
					INNER JOIN publisher p ON m.fk_publisher_id = p.publisher_id
					INNER JOIN media_type mt ON m.fk_media_type_id = mt.media_type_id";
			
			$result = $mysqli->query($sql);
			if (!$result) {
	       		echo "SQL query failed!!!";
	    	}
	    	
			$rows = $result->fetch_all(MYSQLI_ASSOC);
		?>

		<div class="row">
			<table class="table table-hover">
				<thead>
				 	<tr>
					  	<th>Cover</th>
					    <th>Title</th>
					    <th>Author</th>
					    <th>Type</th>
					    <th>Description</th>
					    <th>Publish Date</th>
					    <th>Publisher</th>
					    <th>P. Size</th>
					    <th>ISBN</th>
				  	</tr>
				</thead>
				<tbody>

				<?php
					foreach ($rows as $row) {
						echo "<tr>";
						echo "<td>
								<img src='http://localhost/Giava-Ferrandina-FSWD30-CodeReview10/img/".$row['media_img']."'>
							</td>";
						echo "<td><u>".$row['media_title']."</u></td>";
						echo "<td>".$row['author_first_name']." ".$row['author_last_name']."</td>";
						echo "<td class='type'>".$row['media_type']."</td>";
						echo "<td class='description-td'><div class='description-div'>".$row['media_description']."</div></td>";
						echo "<td class='pdate'>".$row['media_publish_date']."</td>";
						echo "<td class='publisher'>".$row['publisher_name']."</td>";
						echo "<td class='psize'>".$row['publisher_size']."</td>";
						echo "<td class='isbn'>".$row['media_isbn']."</td>";
						echo "</tr>";
					};
				?>

				</tbody>
			</table>

		</div>

	</body>
</html>

<?php ob_end_flush(); ?>