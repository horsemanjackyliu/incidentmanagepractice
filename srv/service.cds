using { iac_adoptionlab as my } from '../db/schema.cds';

using { S4HC_BUILDAPP_JACKY.A_BusinessPartner } from './external/S4HC_BUILDAPP_JACKY';

@path : '/service/Processor'
service Processor
{
    @odata.draft.enabled
    entity Incidents as
        projection on my.Incidents;

    entity Customers as
        projection on A_BusinessPartner
        {
            BusinessPartner,
            FirstName,
            LastName
        };

    entity Conversations as
        projection on my.Conversations;

    entity Urgency as
        projection on my.Urgency;
}

annotate Processor with @requires :
[
    'authenticated-user'
];
