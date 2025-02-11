<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400&family=Pacifico&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #ffdde1, #ee9ca7);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            flex-direction: column;
            overflow: hidden;
        }

        h1 {
            font-family: 'Pacifico', cursive;
            font-size: 3rem;
            color: #ffffff;
            animation: fadeIn 2s ease-in-out;
        }

        p {
            font-size: 1.2rem;
            color: white;
            animation: slideUp 1.5s ease-in-out;
        }

        .button {
            background-color: #ffafbd;
            padding: 12px 24px;
            border-radius: 25px;
            font-size: 1rem;
            color: white;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .button:hover {
            background-color: #ffc3a0;
            transform: scale(1.1);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
    </style>
</head>
<body>

    <h1>Welcome to My Cute Laravel Page! 🌸</h1>
    <p>Enjoy the pastel vibes and animations ✨</p>

    <!-- Animated Lottie File -->
    {{-- <lottie-player 
        src="https://assets6.lottiefiles.com/packages/lf20_zzr5rwgm.json" 
        background="transparent"  
        speed="1"  
        style="width: 300px; height: 300px;"  
        loop  
        autoplay>
    </lottie-player> --}}

    <a href="#" class="button">Get Started</a>

</body>
</html>
