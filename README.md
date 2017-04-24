# SymbiozaVI - warsztaty z R

- [Plan warsztatów](#plan)
- [Opis warsztatów](#opis-warsztatów)
  - [Podstawowe testy statystyczne w R](#podstawowe-testy-statystyczne-w-r)
  - [Podstawy klasyfikacji w R](#podstawy-klasyfikacji-w-r)
- [Prowadzacy](#prowadzący)
- [Dodatkowe materiały](#dodatkowe-materiały)

## Plan

26.05.2017

- 09:00 - 11:00 Podstawowe testy statystyczne w R
- 11:00 - 11:30 przerwa
- 11:30 - 13:30 Podstawy klasyfikacji w R

## Opis warsztatów

Podczas warsztatów pracować będziemy z danymi pochodzącymi z badania *The Cancer Genome Atlas* (https://cancergenome.nih.gov/). Dane będą wcześniej przygotowane i nie będzie potrzebna dodatkowa instalacja żadnego pakietu. Skupimy się na danych klinicznych, danych o mutacjach genów i danych o ekspresjach genów. Opis danych pojawi się na stronie warsztatu i zostanie przesłany zarejestrowanym uczestnikom odpowiednio wcześniej przed warsztatem.

Od uczestników oczekuje się, że potrafią samodzielnie:

- pobrać i zainstalować pakiet statystyczny R https://cran.r-project.org/
- pobrać i zainstalować środowisko do pracy w R - RStudio https://www.rstudio.com/

### Podstawowe testy statystyczne w R

Testy statystyczne wykorzystywane są w wielu dziedzinach nauki. Pomagają weryfikować hipotezy badawcze. Ich przykłady użycia znaleźć można w wielu czasopismach naukowych z obszarów biologii, medycyny czy bioinformatyki. Można rzec, że są podstawą w dzisiejszym procesie przeprowadzania badań klinicznych, dlatego warto je rozumieć i umieć z nich korzystać.

W ramach warsztatu pokażemy podstawowe testy statystyczne dostępne w R. Omówimy z grubsza metodologię oraz na przykładach przedstawimy kilka zastosowań do danych klinicznych. Pokażemy jak odczytywać, interpretować i zapisywać wyniki przeprowadzonych testów statystycznych. Postaramy się przedstawić testy dla 2ch grup, dla wielu grup, testy post-hoc oraz zwrócimy szczególną uwagę na problemy związane z testowaniem zbioru hipotez (czasem nazywanym wielokrotnym testowaniem).

### Podstawy klasyfikacji w R

Klasyfikacja (analiza dyskryminacji) to użyteczne narzędzie służące do oceniania prawdopodobieństwa przynależności pewnego obiektu do jednej z rozważanych grup. Technika ta przydaje się przy ocenie, między innymi: szansy spłaty kredytu przez daną osobę, możliwości nawrotu choroby u pacjena czy prawdopodobieństwa dokonania zakupu przez klienta. Pomimo wielu zastosowań tej dziedziny, algorytmy klasyfikacji niekiedy bywają bardzo proste i nie wymagają zaawansowanej wiedzy matematycznej. 

Podczas warsztatu postaramy się przedstawić podstawowe algorytmy klasyfikacji, które są dostępne w R. Opis algorytmów poprzemy przykładami z kodem, które zastosujemy do danych biologicznych. Przeprowadzimy przez proces przygotowania algorytmu, od konstrukcji modelu statysytcznego na zbiorze treningowym, do sprawdzenia skuteczności systemu statystycznego na zbiorze testowym. Wszystko ubierzemy w przystępne i czytelne komentarze ze strony ekspertów. 

## Prowadzący

#### Marcin Kosiński

Marcin Kosiński jest wiernym entuzjastą pakietu statystycznego R. Wykorzystywał pakiet R w obszarze spersonalizowanej rekomendacji artykułów w czasie rzeczywistym na portalu wp.pl, w ramach stanowiska Data Scientist w Grupie Wirtualna Polska, gdzie pracował przez 30 miesięcy (do marca 2017). Od początku 2017 freelanceR (http://r-addict.com/). Organizator Warszawskich Spotkań Entuzjastów R (wser.pl) oraz główny organizator Ogólnopolskiej Konferencji Użytkowników R - Why R? 2017 (27-29 września, Warszawa) (whyr.pl). Z wykształcenia absolwent Statystyki Matematycznej i Analizy Danych na Politechnice Warszawskiej. Pasjonat modeli analizy przeżycia i biostatystyki - wciąż poszukuje nowych pomysłów na wizualizacje wyników z tych obszarów. 

#### Krzysztof Słomczyński 

Krzysztof Słomczyński jest zagorzałym entuzjastą pakietu R. Na co dzień pracuje przy projektach Open Source. Patrycypował w dwóch pakietach znajdujących się na CRAN – FSelectorRcpp (http://github.com/mi2-warsaw/FSelectorRcpp) i DepthProc (http://github.com/zzawadz/DepthProc) oraz stanowił jeden z filarów zespołu analizującego oferty Data Science na portalu pracuj.pl (http://smarterpoland.pl/index.php/2017/01/is-it-a-job-offer-for-a-data-scientist/). Uzbrojony w niepohamowany optymizm, wraz z pomocą narzędzi do analizy danych kreuje pomysły na nowe ich zastosowania. W przyszłości pragnie zatrudnić się na dłużej jako Data Scientist. Z wykształcenia inżynier lotnictwa, dostrzega wagę skutecznego podejmowania decyzji na podstawie danych. Zwraca uwagę na najdrobniejsze detale i uparcie dba o jakość kodu i danych.


## Dodatkowe materiały

- Darmowy Kurs MOOC Analizy i Przetwarzania Danych w R - [Pogromcy Danych](http://pogromcydanych.icm.edu.pl/)
- [Przewodnik po pakiecie R, P. Biecek](http://biecek.pl/R/)
- [Analiza danych z programem R, P. Biecek](http://biecek.pl/Analiza.Danych/)
- [Programowanie w języku R, M. Gągolewski](http://rksiazka.rexamine.com/)
- [In-depth introduction to machine learning in 15 hours of expert videos](http://www.r-bloggers.com/in-depth-introduction-to-machine-learning-in-15-hours-of-expert-videos/)
- [Microsoft Launches Its First Free Online R Course on edX](http://www.r-bloggers.com/microsoft-launches-its-first-free-online-r-course-on-edx/)
