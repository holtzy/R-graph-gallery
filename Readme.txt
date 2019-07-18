TM_WORLD_BORDERS-0.1.ZIP 

Provided by Bjorn Sandvik, thematicmapping.org

Use this dataset with care, as several of the borders are disputed.

The original shapefile (world_borders.zip, 3.2 MB) was downloaded from the Mapping Hacks website:
http://www.mappinghacks.com/data/

The dataset was derived by Schuyler Erle from public domain sources.
Sean Gilles did some clean up and made some enhancements.


COLUMN		TYPE			DESCRIPTION

Shape		Polygon			Country/area border as polygon(s)
FIPS		String(2)		FIPS 10-4 Country Code
ISO2		String(2)		ISO 3166-1 Alpha-2 Country Code
ISO3		String(3)		ISO 3166-1 Alpha-3 Country Code
UN		Short Integer(3)	ISO 3166-1 Numeric-3 Country Code 
NAME		String(50)		Name of country/area
AREA		Long Integer(7)		Land area, FAO Statistics (2002) 
POP2005		Double(10,0)	 	Population, World Polulation Prospects (2005)
REGION		Short Integer(3) 	Macro geographical (continental region), UN Statistics
SUBREGION	Short Integer(3)	Geogrpahical sub-region, UN Statistics
LON		FLOAT (7,3)		Longitude
LAT		FLOAT (6,3)		Latitude


CHANGELOG VERSION 0.3 - 30 July 2008

- Corrected spelling mistake (United Arab Emirates)
- Corrected population number for Japan
- Adjusted long/lat values for India, Italy and United Kingdom


CHANGELOG VERSION 0.2 - 1 April 2008

- Made new ZIP archieves. No change in dataset.


CHANGELOG VERSION 0.1 - 13 March 2008

- Polygons representing each country were merged into one feature
