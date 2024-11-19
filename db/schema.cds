namespace iac_adoptionlab;

using { S4HC_BUILDAPP_JACKY } from '../srv/external/S4HC_BUILDAPP_JACKY.cds';

using { sap.common.CodeList } from '@sap/cds/common';

entity Incidents
{
    key ID : UUID
        @Core.Computed;
    title : String(100)
        @title : 'Tittle';
    conversations : Composition of many Conversations on conversations.incidents = $self;
    urgency : Association to one Urgency;
    customer : Association to one S4HC_BUILDAPP_JACKY.A_BusinessPartner;
}

entity Urgency : CodeList
{
    key code : UrgencyCode;
}

entity Conversations
{
    key ID : UUID
        @Core.Computed;
    timestamp : DateTime
        @cds.on.insert : $now;
    author : String(100)
        @cds.on.insert : $user;
    message : String(100);
    incidents : Association to one Incidents;
}

type UrgencyCode : String enum
{
    High = 'H';
    Medium = 'M';
    Low = 'L';
}
