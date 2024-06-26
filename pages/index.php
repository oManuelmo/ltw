
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" href="../css/mainPageStyle.css">
    <link rel="stylesheet" href="../css/headerStyle.css">
    <link rel="stylesheet" href="../css/menuBarStyle.css">
    <link rel="stylesheet" href="../css/hightlightedProductsStyle.css">
    <link rel="stylesheet" href="../css/popupsStyle.css">
    <script src="../javascript/script.js"></script>
</head>
<body>
    <header>
        <a href="index.php">
            <img src="../docs/logo.png" alt="Normal logo" width="100">
        </a>
        <form action="/search" method="get" class="search-form">
            <div class="search-container">
                <button type="submit">Search</button>
                <input type="text" name="search" placeholder="Search Maets.com">
            </div>
        </form>
        <div class="header-buttons">
            <button class="sell-button">Sell</button>
            <button class="message-button"><img src="../docs/icons/messages.png" alt="Messages"></button>
            <button onclick="togglePopup(1)" class="account-button"><img src="../docs/icons/account.webp" alt="My Account"></button>
            <div class="popup" id="popup-1">
                <div class="overlay"></div>
                <div class="content1">
                    <form action="pages/loginPage.php">
                        <button class="loginbtn">Login</button>
                    </form>
                    <form action="pages/registerPage.php">
                        <button class="registerbtn">Register</button>
                    </form>
                    <div class="closebtn" onclick="togglePopup(1)">&times;</div>
                    <div class="writes">
                        <h1>My account</h1>
                        <div class="myaccountbtn">My account</div>
                        <div class="wishlistbtn">Wish list</div>
                        <div class="separator1"></div>
                        <h1>Sell</h1>
                        <div class="yourproductsbtn">Your products</div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="content">
        <div class="menu-buttons">
            <button onclick="togglePopup(2)" class="menu-button"><img src="../docs/icons/menu.png" alt="Menu"></button>
            <div class="popup" id="popup-2">
                <div class="overlay"></div>
                <div class="content1">
                    <div class="popupbtn">My account</div>
                    <div class="closebtn" onclick="togglePopup(2)">&times;</div>
                    <div class="writes">
                        <h1>Buy</h1>
                        <div class="gamesbtn">Games</div>
                        <div class="consolesbtn">Consoles</div>
                        <div class="separator1"></div>
                        <h1>Sell</h1>
                        <div class="sellyourproductbtn" id="separate">Sell your product</div>
                        <div class="separator2"></div>
                        <div class="suppotbtn">Support</div>
                        <div class="aboutusbtn">About us</div>
                        <div class="faqbtn">FAQ</div>
                        <div class="tandcbtn">Terms & Conditions</div>
                    </div>
                </div>
            </div>
            <button class="consoles-button">Consoles</button>
            <button class="playstation-button">PlayStation</button>
            <button class="xbox-button">XBox</button>
            <button class="pc-button">PC</button>
        </div>
        <div class="slideshow-container">

            <div class="highlighted-product"> 
                <img src="https://gaming-cdn.com/images/products/14986/orig/minecraft-java-bedrock-edition-deluxe-collection-deluxe-collection-pc-jogo-microsoft-store-europe-cover.jpg?v=1696925849" class="product-image">
                <div class="product-description">
                    <h1>Minecraft</h1>
                    <p>"Minecraft is a game made up of blocks, creatures, and community. You can survive the night or build a work of art – the choice is all yours. But if the thought of exploring a vast new world all on your own feels overwhelming, then fear not! Let's explore what Minecraft is all about!" - Minecraft.</p>
                    <a href="https://www.minecraft.net/">Visit the official site.</a>
                    <button>Enter</button>
                </div>
            </div>
            <div class="highlighted-product">
                <img src="https://i5.walmartimages.com/seo/Sony-PlayStation-5-Video-Game-Console-Ps5-Disc-Console-New_396aa760-b2f6-4c06-8dc5-276184a85dc6.0d8c80439262394fc4edabb03056daa3.jpeg" class="product-image">
                <div class="product-description">
                    <h1>Playstation 5</h1>
                    <p>The PlayStation 5 (PS5) is a next-generation gaming console developed by Sony Interactive Entertainment. Released in late 2020, it offers cutting-edge hardware and technology to deliver immersive gaming experiences.</p>
                    <a href="https://www.playstation.com/pt-pt/">Visit the official site.</a>
                    <button>Enter</button>
                </div>
            </div>
            <div class="highlighted-product">
                <img src="https://assets.nintendo.eu/image/upload/f_auto/q_auto/v1617275520/MNS/Content%20Pages%20Assets/Category-List%20Pages/Consoles/Nintendo%20Switch%20Hub/2000x1125_Consoles_Switch_Flagship_BeautyShot.jpg" class="product-image">
                <div class="product-description">
                    <h1>Nintendo Switch</h1>
                    <p>The Nintendo Switch is a hybrid video game console, consisting of a console unit, a dock, and two Joy-Con controllers. Although it is a hybrid console, Nintendo classifies it as "a home console that you can take with you on the go".</p>
                    <a href="https://www.nintendo.com/us/switch/system/">Visit the official site.</a>
                    <button>Enter</button>
                </div>
            </div>
            <div class="highlighted-product">
                <img src="https://flowgames.gg/wp-content/uploads/2023/04/image-2023-04-03T113354.466.jpg" class="product-image">
                <div class="product-description">
                    <h1>GTA VI</h1>
                    <p>Grand Theft Auto VI heads to the state of Leonida, home to the neon-soaked streets of Vice City and beyond in the biggest, most immersive evolution of the Grand Theft Auto series yet. Set within the fictional open world state of Leonida—based on Florida—and its Miami-inspired Vice City, the story is expected to follow the criminal duo of Lucia and her male partner.</p>
                    <a href="https://www.rockstargames.com/VI">Visit the official site.</a>
                    <button>Enter</button>
                </div>
            </div>
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
            <span class="dot" onclick="currentSlide(4)"></span>
        </div>
    </div>
</body>
</html>
