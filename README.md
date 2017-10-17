# Arbejder

## Restaurant Manager

Arbejder to aplikacja, którą postanowiłem zbudować podczas nauki Ruby on Rails. Jest ona uniwersalnym systemem, za pomocą którego można zarządzać pracownikami oraz asortymentem restauracji.

### Instalacja

Aby zainstalować aplikację, należy sklonować repozytorium, a następnie, będąc w katalogu aplikacji:

`bundle install`

Aby uruchomić aplikację:

`rails s`, 

a w przeglądarce:

`localhost:3000` 

Możliwości aplikacji:
* dodawanie, usuwanie, edycja pracowników
* dodawaniem, usuwanie, edycja potraw
* przyjmowanie zamówień
* prowadzenie statystyk dotyczących zamówień, takich jak: liczba zamówień przyjętych przez pracowników (ogółem oraz na przestrzeni tygodnia), obliczanie średniej wartości zamówienia, obliczanie utargu dziennego oraz ogółem, ustalenie najpopularniejszej potrawy (ogółem oraz w obecnym dniu)
* wewnętrzna komunikacja między pracownikami w stylu Facebookowego news feeda
* dodawanie przez admina przypiętego posta utrzymującego się na szczycie przez 24 godziny
* wyszukiwanie pracowników w wyszukiwarce

Wykorzystane gemy:
* Devise
* Cocoon (obsługa zagnieżdżonych formularzy)
* CanCanCan
* Ransack
* Rubocop (sprawdzenie czystości kodu)
* Paperclip