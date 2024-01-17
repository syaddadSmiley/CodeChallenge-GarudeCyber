<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Desktop styles */
        .nav {
            display: flex;
            justify-content: space-between;
            background-color: #f1f1f1;
            padding: 10px;
        }

        .nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center; /* Align items vertically */
        }

        .nav ul li {
            margin-right: 10px;
        }

        .nav ul li a {
            text-decoration: none;
            color: #333;
            padding: 5px;
        }

        /* Mobile styles */
        @media only screen and (max-width: 600px) {
            .nav {
                flex-direction: column;
            }

            .nav ul li {
                margin-bottom: 10px;
            }

            .nav ul {
                justify-content: flex-end; /* Align items to the right */
            }
        }
    </style>
</head>
<body>
    <div class="nav">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
</body>
</html>
