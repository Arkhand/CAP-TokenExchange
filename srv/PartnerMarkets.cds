using {ccrtService} from './cat-service';

annotate ccrtService.PartnerMarkets with @(

    UI.SelectionFields    : [
        genericName,
        aliancePartner,
        market
        
    ],

    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: genericName,
        },
        {
            $Type: 'UI.DataField',
            Value: aliancePartner,
        },
        {
            $Type: 'UI.DataField',
            Value: market
        }
    ],

    // Header information for object page
    UI.HeaderInfo : {
        $Type: 'UI.HeaderInfoType',
        TypeName: 'Partner Market',
        TypeNamePlural: 'Partner Markets',
        Title: {
            $Type: 'UI.DataField',
            Value: genericName
        }
    },

    // Formulario para creación y edición
    UI.FieldGroup #GeneralInformation : {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                $Type: 'UI.DataField',
                Value: genericName,
                Label: 'Generic Name'
            },
            {
                $Type: 'UI.DataField',
                Value: aliancePartner,
                Label: 'Alliance Partner'
            },
            {
                $Type: 'UI.DataField',
                Value: market,
                Label: 'Market'
            }
        ]
    },

    UI.Facets : [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'GeneralInformationFacet',
            Target: '@UI.FieldGroup#GeneralInformation',
            Label: 'General Information'
        }
    ],

    // Habilitar operaciones CRUD con configuración inline
    Capabilities.InsertRestrictions: {
        $Type: 'Capabilities.InsertRestrictionsType',
        Insertable: true,
        RequiredProperties: [
            genericName,
            aliancePartner,
            market
        ]
    },

    Capabilities.UpdateRestrictions: {
        $Type: 'Capabilities.UpdateRestrictionsType',
        Updatable: true
    },

    Capabilities.DeleteRestrictions: {
        $Type: 'Capabilities.DeleteRestrictionsType',
        Deletable: true
    }

);

// Habilitar edición inline para cada campo
annotate ccrtService.PartnerMarkets with {
    genericName @(
        title: 'Generic Name',
        Common.FieldControl: #Mandatory
    );
    
    aliancePartner @(
        title: 'Alliance Partner', 
        Common.FieldControl: #Mandatory
    );
    
    market @(
        title: 'Market',
        Common.FieldControl: #Mandatory  
    );
};