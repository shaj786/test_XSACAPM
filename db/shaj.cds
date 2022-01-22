namespace shaj.CoreDataViews;

using { shaj.db.master, shaj.db.transaction  } from './datamodel';

context CoreViews {
    
    define view![WorklistPO] as
    select from transaction.purchaseorder{
        key PO_ID as![PurchaseOrderId],
            PARTNER_GUID.BP_ID as![PartnerId],
            PARTNER_GUID.COMPANY_NAME as![CompanyName],
            GROSS_AMOUNT as![POGrossAmount],
            Currency.code as![POCurrencyCode],
            LIFECYCLE_STATUS as![POStatus],
        key Items.PO_ITEM_POS as![ItemPosition],
            Items.PRODUCT_GUID.PRODUCT_ID as![ProductId],
            Items.PRODUCT_GUID.DESCRIPTION as![ProductName],
            PARTNER_GUID.ADDRESS_GUID.CITY as![City],
            PARTNER_GUID.ADDRESS_GUID.COUNTRY as![Country],
            Items.GROSS_AMOUNT as![GrossAmount],
            Items.NET_AMOUNT as![NetAmount],
            Items.TAX_AMOUNT as![TaxAmount],
            Items.Currency.code as![CurrencyCode],
    }
    }