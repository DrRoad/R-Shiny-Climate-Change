function(){
	tabPanel("About",
		HTML("<h1> Homayoun Banazadeh</h1>
        <p>This is my second shiny app. For this time, I was interested to explore the temperature and co2 data. I discovered a paradox within the mean temperature data that although we know the temperature has been going up eventually, the representation obtained from combining all of the regions shows that it has been going down. This is an example of Simpson's Paradox. In the first tab, I display the mean temperature data using two methods. One, by averaging over all of the months using all of the data sets. Two by averaging the Annual column over the years.The result is somehow interesting because the trends are similar but there is a shift in them making one always above the other. Later, I add the data for min temp and max temp. In the second tab, I do the regression analysis for average co2 ppm and average temperature to see if there is a positive relationship between them.</p>
        <p>CO2 at surface level averaged over the world reference:
          Dlugokencky, E.J., K.W.Thoning, P.M. Lang, and P.P. Tans (2017), NOAA Greenhouse Gas Reference from Atmospheric Carbon Dioxide Dry Air Mole Fractions from the NOAAESRL Carbon Cycle Cooperative Global Air Sampling Network. Data Path: ftp://aftp.cmdl.noaa.gov/data/trace_gases/co2/flask/surface/. </p>
        <p> Maximum surface air temperatures for more that 300 locations in Canada data reference:
          Adjusted and Homogenized Canadian Climate Data (AHCCD). (2018, November 21). Retrieved April 1, 2019, from http://data.ec.gc.ca/data/climate/scientificknowledge/adjusted-and-homogenized-canadian-climate-data-ahccd/
        <p> Minimum surface air temperatures for more that 300 locations in Canada data reference:
          Adjusted and Homogenized Canadian Climate Data (AHCCD). (2018, November 21). Retrieved April 1, 2019, from http://data.ec.gc.ca/data/climate/scientificknowledge/adjusted-and-homogenized-canadian-climate-data-ahccd/


 
		<p>My name is Homayoun Banazadeh and I'm currently studying Data Scinece at Simon Fraser University. I'm looking for a coop job and my interests are app development, using APIs to demonstrate meaningful data from platforms such as Reddit, Twitter, Facebook and Instagram. </p>"
		),
        HTML('<p>
        <a href="https://twitter.com/HBanazadeh" target="_blank">Twitter</a><br>
        <a href="https://www.linkedin.com/in/homayounbanazadeh/" target="_blank">Linkedin</a> <br/>
        </p>'),
		value="about"
	)
}
