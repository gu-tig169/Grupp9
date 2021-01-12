# Grupp 9

Ett projektarbete för TIG169 av Grupp 9 bestående av Hampus, John, Jonathan, Julia, Leo, och Martin. 

## Beskrivning

En applikation som gör det möjligt att söka efter recept från Spoonaculars API. Sökningen går att göras dels efter namn på recept, dels baserat på ingredienser. Utöver det går det även att hämta ett slumpmässigt skämt/kuriosa från API:et. 

## Struktur

Mapp-, fil- och kodstrukturen är utformad efter de konventioner som nämns i 'Effective Dart'. Strukturen är tänkt att ge en tydlig bild för utomstående över hur koden sitter ihop, samt göra det enkelt att navigera sig mellan appens olika funktioner och vyer. Mapparna och filerna är indelade efter innehåll och egenskaper, exempelvis ligger alla vyer i egna mappar under mappen 'screens'. Utifrån de olika vyernas funktionalitet kan flera vyer ligga i samma mapp, som i fallet med mappen 'search_views' där två vyer med liknande funktionalitet delar mapp trots att de har något annorlunda utseende. Återkommande widgets har brutits ut och placerats i egna mappar.

    ├───lib
    │   ├───models
    │   ├───screens
    │   │   ├───focus_views
    │   │   ├───home_view
    │   │   ├───joke_trivia_view
    │   │   └───search_views
    │   │       └───widgets
    │   ├───service
    │   └───widgets
    └───test

## Funktioner

Appens huvudfunktioner är att hämta recept baserade på vad användaren skriver in för värde. Det finns två olika receptlistor som visar olika resultat baserat på vad användaren efterfrågar. Receptlistan (recipe_search_view) visar resultat utifrån namnet på receptet skriver in medan den andrar receptfunktionen (ingredient_search_view) visar resultat utifrån de ingredienser som efterfrågas. Tanken är att både kunna söka upp recept på vad man vill tillaga samt på vad man själv har för ingredienser i hemmet. När man klickar på recepten får man upp information om tillvägagångssätt för tillagning steg för steg samt information om vilka ingredienser som behövs. 

Den sekundära funktionen i appen ger användaren en möjlighet att få tillgång till olika matrelaterade skämt och trivia. Alla anrop innehåller en http-get-metod med en API-nyckel för att kunna hämta information och möjliggöra dessa funktioner. Alla funktioner är hämtade från API:et nedan. 

## API

https://spoonacular.com/food-api/
