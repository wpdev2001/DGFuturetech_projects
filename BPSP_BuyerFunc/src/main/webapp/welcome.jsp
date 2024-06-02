<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="ISO-8859-1">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    <link rel="stylesheet" href="welcome-styles.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <nav>
        <div class="navbar">
            <div class="logo"><a href="#">DGFutureTech</a></div>
            <ul class="menu">
                <li><a href="Controller?action=home">Home</a></li>
                <li><a href="Controller?action=buyersList">Buyers List</a></li>
                <li><a href="Controller?action=logout">Logout</a></li>
            </ul>
        </div>
    </nav>
    <section id="Home">Welcome, ${username}!</section>
    <section id="About">About Section</section>
    <section id="Category">Category Section</section>
    <section id="Contact">Contact Section</section>
    <section id="Feedback">Feedback Section</section>
    <div class="button">
        <a href="#Home"><i class="fas fa-arrow-up"></i></a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
