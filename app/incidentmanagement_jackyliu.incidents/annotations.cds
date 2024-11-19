using Processor as service from '../../srv/service';
annotate service.Incidents with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Urgency',
                Value : urgency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : customer_BusinessPartner,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversations',
            ID : 'Conversations',
            Target : 'conversations/@UI.LineItem#Conversations',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Urgency',
            Value : urgency_code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer',
            Value : customer_BusinessPartner,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Incidents with {
    customer @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Customers',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : customer_BusinessPartner,
                    ValueListProperty : 'BusinessPartner',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName',
                },
            ],
            Label : 'Customer',
        },
        Common.Text : {
            $value : customer_BusinessPartner,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Incidents with {
    urgency @(
        Common.Text : {
            $value : urgency.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Urgency',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : urgency_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Urgency',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Urgency with {
    code @Common.Text : {
        $value : descr,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

annotate service.Conversations with @(
    UI.LineItem #Conversations : [
        {
            $Type : 'UI.DataField',
            Value : author,
            Label : 'author',
        },
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },
    ]
);

