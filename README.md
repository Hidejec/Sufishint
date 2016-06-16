# Sufishint
PROJECT SUFISHINT Developed by TEAM LIQUIDO


## Inspiration
The Inspiration of creating the application is the high statistics of uncontrolled both fishermen and commercial vessels of any category (small scale, medium scale, and large scale). There had been a lot of policies and regulations governing the Philippine Sea considering that the Philippines is at the center of the coral triangle, making this a main reason to think about the abundance of marine ecosystem including fishes of different species.

The goal of the application is to promote sustainable fisheries through responsible fishing controlled by policies and regulations.

## What it does
We have highly considered the transition of each information and escalation of data, we have used the Fisheries Information for Sustainable Harvests - Bio Economic Model (FISH-BE Model) by the USAID Foundation to now the maximum number of fishers which can be accomodated by the system without causing both demersal and pelagic stocks to collapse and know the minimum total MPA size to avert the collapse of both demersal and pelagic stocks (USAID, 2007).

The application is divided in three parts:

Phase 1: General Information for Public Awareness as the application gets the coordinates from the User's Geographic location via GPS. Upon getting the geographic location through the coordinates gathered, it will display the following information necessary for those who wish to do marine activities in the area:

Laws and Regulations including ordinances (barangay to municipal level regulations);
Weather outlook including the Precipitation, Humidity, Tide, and water level;
Demographics and necessary contact information available for aid in case needed.
Phase 2: Biological Information of fishes present in the area shown to give a better understanding on our marine species most specifically the following:

Species and size
Habitat and abundance
Spawning and Catching Seasons calendar that will show the spawning season and the best time to hunt the fish. (The mentioned seasons will still vary per location). Beside the dates are smaller numbers indicating the number of influx of vessels present in the zone*.
Phase 3: A module that address the IUU through active monitoring of Commercial Vessels and fishing boats using the data from the GPS and the data fro the Vessel Monitoring System (VMS). The VMS will show the vessels in the zone* including their information and their coordinates. This will be easier for BFAR personnel to monitor the vessels and boats who illegally fish and foreign vessels who fish in Philippine territories.

The map will also show the activities of the vessels or boats specifically their origin and every docking to ports until if the vessels did exportation activities until they reach again the Philippine waters and local zones.

*Zone is referred to as the area covered by the territories within the 24 nautical miles.

## How we built it
The application was built in HTML, CSS, Javascript, and other frameworks through Phone Gap. We made sure that the data from the central server (cloud server) of BFAR will be used to verify and validate registration of licensed vessels in the app. Data were gathered based on the existing information available and shall also consider focus group discussion with various organizations to suffice the needed information. Slim Framework was also used in the application while images were processed according to web standards.

Open Source Vessel Monitoring API from Google has been used to show the capability of the application to be monitoring the seas by plotting coordinates in the map. Real time information will be transmitted by the satellite and shall be interpreted by the end point where the data is processed before translating into map coordinates.

## Challenges we ran into
Challenges would only be the lack of data and information about Philippine waters. Unlike international seas or countries such as USA and the likes, data in the Philippines aren't open YET. Hence, thorough research must be done to sustain the application.

Upon implementation, resources might limit the execution of such system hence intervention from the government and partners are needed.

## Accomplishments that we're proud of
The application was able to address issues of IUU and will urge the local BFAR to revisit and review existing policies and reconsider in adding innovation as part of the process in mobilizing existing regulations.

## What we learned
We learned that it's really hard to combat overfishing, that "Managing Fisheries is hard: it's like managing a forest which trees are invisible and keep moving around" (John Shepherd, 1978). Furthermore, that in order for us to fully mobilize policies, there should be measures that we need to do and technology plays an important role in this.

## What's next for Project SuFishInT
The application shall be sustained with information and data it lacks to make it more comprehensive and information-ready for those who seek learning about Marine Protection and Preservation. Will also add map that will show presence of Chlorophyll A in the Philippine waters that will determine assumably fish productivity. We will also map MPAs or Marine Protected Areas, and create a Shell Fish Bulletin if HABS (Harmful Algal Blooms) occurs on a particular period.
