sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incidentmanagementjackyliu/incidents/test/integration/FirstJourney',
		'incidentmanagementjackyliu/incidents/test/integration/pages/IncidentsList',
		'incidentmanagementjackyliu/incidents/test/integration/pages/IncidentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incidentmanagementjackyliu/incidents') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);