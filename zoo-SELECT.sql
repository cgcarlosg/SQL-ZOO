-- SELECT BASICS

-- Introducing the world table of countries

-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';
-- Modify it to show the population of Germany

SELECT population FROM world
  WHERE name = 'Germany'

-- Scandinavia

-- 2. Checking a list The word IN allows us to check if an item is in a list. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark')

-- Just the right size

-- 3. Which countries are not too small and not too big?. Show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- SELECT from WORLD

-- 1. Observe the result of running this SQL command to show the name, continent and population of all countries.

SELECT name, continent, population FROM world

-- Large Countries

-- 2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros

SELECT name FROM world
WHERE population >= 200000000

-- Per capita GDP

-- 3. Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, GDP/population FROM world
WHERE population >= 200000000

-- South America In millions

-- 4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000 FROM world
WHERE continent = 'South America'

-- France, Germany, Italy

-- 5. Show the name and population for France, Germany, Italy

SELECT name, population FROM world
  WHERE name IN ('France', 'Germany', 'Italy')

-- United

-- 6. Show the countries which have a name that includes the word 'United'

SELECT name FROM world
  WHERE name LIKE '%united%'


-- Two ways to be big

-- 7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

-- One or the other (but not both)

-- 8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.
-- Australia has a big area but a small population, it should be included.
-- Indonesia has a big population but a small area, it should be included.
-- China has a big population and big area, it should be excluded.
-- United Kingdom has a small population and a small area, it should be excluded.

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

-- Rounding

-- 9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- For South America show population in millions and GDP in billions both to 2 decimal places. Millions and billions

SELECT Name, ROUND(population / 1000000, 2),
    ROUND(GDP / 1000000000, 2) FROM world WHERE
    continent = 'south America'

-- Trillion dollar economies

-- 10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
--  Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name, ROUND(GDP / population, -3) FROM world
WHERE GDP >= 1000000000000

-- Name and capital have the same length

--     11. Greece has capital Athens.Each of the strings 'Greece', and 'Athens' has 6 characters.Show the name and capital where the name and the capital have the same number of characters.
-- You can use the LENGTH function to find the number of characters in a string

SELECT name, capital FROM world
WHERE length(name) = length(capital)

-- Matching name and capital

--     12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character. 
-- You can use <> as the NOT EQUALS operator.

SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- All the vowels

-- 13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.
-- Find the country that has all the vowels and no spaces in its name.
-- You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
-- The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'

SELECT name FROM world WHERE
    name LIKE '%u%' and name LIKE '%a%' and name LIKE '%o%'
    and name LIKE '%i%' and name LIKE '%e%' and name NOT LIKE '% %' 

-- Nobel Laureates
-- Winners from 1950

-- 1. Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950

-- 1962 Literature

-- 2. Show who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 3. Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr, subject FROM nobel WHERE
    winner = 'Albert Einstein'

-- Recent Peace Prizes

-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner FROM nobel
WHERE subject = 'peace' AND yr >= 2000

-- Literature in the 1980's

-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT yr, subject, winner FROM nobel
WHERE subject = 'literature' AND yr >= 1980 AND yr <= 1989

-- Only Presidents

-- 6. Show all details of the presidential winners:
-- Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama

SELECT yr, subject, winner FROM nobel
WHERE winner = 'Theodore Roosevelt' OR winner = 'Woodrow Wilson'
OR winner = 'Jimmy Carter' OR winner = 'Barack Obama'

-- John

-- 7. Show the winners with first name John

SELECT winner FROM nobel WHERE left(winner, 4) = 'john'

-- Chemistry and Physics from different years

-- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT yr, subject, winner FROM nobel WHERE  (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

-- Exclude Chemists and Medics

-- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT yr, subject, winner FROM nobel WHERE
yr = 1980 AND NOT (subject = 'Chemistry' OR subject = 'Medicine')

-- Early Medicine, Late Literature

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
-- together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT yr, subject, winner FROM nobel WHERE
(subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004)

-- Harder Questions
--Umlaut

-- 11. Find all details of the prize won by PETER GRÜNBERG

SELECT * FROM nobel WHERE winner = 'PETER GRÜNBERG'

-- Apostrophe

-- 12. Find all details of the prize won by EUGENE O'NEILL
-- Escaping single quotes

SELECT * FROM nobel WHERE winner = 'EUGENE O''NEILL'

-- Knights of the realm

-- 13. Knights in order
-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%' ORDER BY yr DESC

-- Chemistry and Physics last

-- 14. The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject FROM nobel WHERE yr = 1984 ORDER BY 
subject IN ('Physics', 'Chemistry'), subject, winner 

--SELECT within SELECT Tutorial
-- Using nested SELECT

--Bigger than Russia

-- 1. List each country name where the population is larger than that of 'Russia'. 

SELECT name FROM world WHERE population > (SELECT population FROM
world WHERE name = 'Russia')

-- Richer than UK

-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'. Per Capita GDP

SELECT name FROM world WHERE continent = 'europe' And gdp/population > (SELECT GDP/population FROM world where name = 'United kingdom')

-- Neighbours of Argentina and Australia

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name

-- Between Canada and Poland

-- 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'canada') AND 
population < (SELECT population FROM world WHERE name = 'poland')

-- Percentages of Germany

-- 5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany
-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- The format should be Name, Percentage for example:

SELECT name, CONCAT (Round(100 * population /(SELECT population
FROM world WHERE name = 'germany')), '%') FROM world WHERE
continent = 'europe'

-- Bigger than every country in Europe

-- 6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name FROM world WHERE GDP > All(SELECT GDP FROM world WHERE
continent = 'europe' and GDP > 0)

-- Largest in each continent

-- 7. Find the largest country (by area) in each continent, show the continent, the name and the area:

SELECT continent, name, area FROM world B WHERE area >= ALL (SELECT area FROM world A WHERE A.continent = B.continent AND area > 0)

-- First country of each continent (alphabetically)

-- 8. List each continent and the name of the country that comes first alphabetically. 

SELECT continent, name FROM world A WHERE name <= ALL(SELECT name FROM world B WHERE A.continent = B.continent)

-- Difficult Questions That Utilize Techniques Not Covered In Prior Sections

-- 9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT name, continent, population FROM world WHERE continent IN (SELECT continent FROM world A WHERE 25000000 >= (SELECT MAX(population) FROM world B WHERE A.continent = B.continent))

-- 10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.

SELECT name,continent FROM world A WHERE population > ALL(SELECT 3 * population FROM world B WHERE A.continent = B.continent AND A.name <> B.name)
