--   sum and count
-- World Country Profile: Aggregate functions

-- 1. Show the total population of the world.

SELECT SUM(population) FROM world

List of continents

-- 2. List all the continents - just once each.

SELECT DISTINCT continent FROM world

-- GDP of Africa

-- 3. Give the total GDP of Africa

SELECT SUM(gdp) FROM world WHERE continent = 'africa'

-- Count the big countries

-- 4. How many countries have an area of at least 1000000

SELECT COUNT(name) FROM world WHERE area >= 1000000

Baltic states population

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population) FROM world WHERE name IN('Estonia', 'Latvia', 'Lithuania')

-- Using GROUP BY and HAVING
--Counting the countries of each continent

-- 6. For each continent show the continent and number of countries.

SELECT continent, COUNT(name) FROM world GROUP BY continent

-- Counting big countries in each continent

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.

SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent

-- Counting big continents

-- 8. List the continents that have a total population of at least 100 million.

SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000
