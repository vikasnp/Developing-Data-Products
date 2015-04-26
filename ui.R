#ui.R
library(shiny)
library(ggplot2)

trainData <- read.csv("./data/train.csv")

dataset <- trainData


shinyUI(fluidPage(
	navbarPage("Developing Data Products - Course Project"
	),
	titlePanel("Survival Predictor - A Kaggles Titanic Challenge"),
	sidebarLayout(
	 sidebarPanel(
		
		h3('Adjust Parameters'),

		sliderInput('sampleSize', 'Choose Sample Size', min=1, max=nrow(dataset),
				value=min(300, nrow(dataset)), step=10, round=0),
		selectInput('x', 'X', names(dataset), selected = "Age"),
		selectInput('y', 'Y', names(dataset), selected = "Embarked"),
		selectInput('color', 'Color', selected = "Sex" , c('None', names(dataset))),
    	selectInput('facet_row', 'Facet Row', selected = "Survived", c(None='.', names(dataset))),
    	selectInput('facet_col', 'Facet Column', c(None='.', names(dataset))),
    	downloadButton('downloadData', 'Download Train set'),
    	tags$br(),
    	tags$br(),
    	strong('Description of variables used-'),
    	tags$ul(
    		tags$li('survival - Survival (0 = No; 1 = Yes)'),
    		tags$li('pclass - Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)'),
    		tags$li('name - Name'),
            tags$li('sex - Sex'),
            tags$li('age - Age'),
            tags$li('sibsp - Number of Siblings/Spouses Aboard'),
            tags$li('parch - Number of Parents/Children Aboard'),
            tags$li('ticket - Ticket Number'),
            tags$li('fare - Passenger Fare'),
            tags$li('cabin - Cabin'),    
            tags$li('embarked - Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)'),
            tags$li('cabin - Cabin'), 
            tags$li('cabin - Cabin')
            ),  
		strong('Also,'),
		p(' Pclass is a proxy for socio-economic status (SES)'),
		p('1st ~ Upper; 2nd ~ Middle; 3rd ~ Lower'),
		p('Age is in Years; Fractional if Age less than One (1)'),
		p('If the Age is Estimated, it is in the form xx.5'),
		p('With respect to the family relation variables (i.e. sibsp and parch)
		some relations were ignored.  The following are the definitions used
		for sibsp and parch.'),
		p('Sibling:  Brother, Sister, Stepbrother, or Stepsister of Passenger Aboard Titanic'),
		p('Spouse:   Husband or Wife of Passenger Aboard Titanic (Mistresses and Fiances Ignored)'),
		p('Parent:   Mother or Father of Passenger Aboard Titanic'),
		p('Child:    Son, Daughter, Stepson, or Stepdaughter of Passenger Aboard Titanic'),
		p('Other family relatives excluded from this study include cousins,
		nephews/nieces, aunts/uncles, and in-laws.  Some children travelled
		only with a nanny, therefore parch=0 for them.  As well, some
		travelled with very close friends or neighbors in a village, however,
		the definitions do not support such relations.')
			 
			 ),
	
	 mainPanel(
		h2('Introduction'),
    h4('About App'),
		p('App developed as part of Coursera Developing Data Products Course Project.This is a very simple app making use of simple concepts of Exploratory Data Analysis on the Training set of the Kaggles Titanic Challenge Dataset. This app lets you predict who survives!'),

		h4('About Kaggle Titanic Challenge'),
		p('The sinking of the RMS Titanic is one of the most infamous shipwrecks in history.  On April 15, 1912, during her maiden voyage, the Titanic sank after colliding with an iceberg, killing 1502 out of 2224 passengers and crew. This sensational tragedy shocked the international community and led to better safety regulations for ships.One of the reasons that the shipwreck led to such loss of life was that there were not enough lifeboats for the passengers and crew. Although there was some element of luck involved in surviving the sinking, some groups of people were more likely to survive than others, such as women, children, and the upper-class.'),
		p('So analysing what sorts of people are likely to survive becomes important'),
		tags$br(),
    p('It uses data set from Kaggles Titanic Challenge found here'),
    a("https://www.kaggle.com/c/titanic/download/train.csv"),
		tags$br(),tags$br(), 
    p('This work is inspired from Trevors tutorial which can be found'),
    a("http://trevorstephens.com/post/72916401642/titanic-getting-started-with-r"),
		
		tags$br(),  tags$br(),
    
    h2('Getting Started'),
		p('This App has a side panel in which you can change various parameters and set some parameters to each axis.'),
		p('The Main Body of the App shows plots for the parameters selected in Side Panel'),
    p('The app also lets the user to experiment with the chosen data directly.'),
    
    h2('Result'),
		p('Default parameters have been set for each axis as visible in the plot below.'),
		p('From the default settings, the plot is intended to allow the comparison among some variables:'),
		tags$ul(
			tags$li('Compare the sex of the Survivors. Any prevaling?'),
			tags$li('Compare the Port of Embarkation. Any port with more survivors?'),
			tags$li('Compare age of Passengers. Any prevaling?')
		),
		
		plotOutput('plot'),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),
		tags$br(),


		h4('Raw Training Dataset'),
		
		tags$br(),
		tabPanel('trainData', dataTableOutput('mytable1'))
				
	 )
	)
))