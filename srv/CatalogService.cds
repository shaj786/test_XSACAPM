using { shaj.db.master, shaj.db.transaction, shaj.db.CDSViews, CV_PURCHASE, CV_PURCHASE_ORD } from '../db/datamodel';


service CatalogService@(path:'/CatalogService') 
    @(requires: 'authenticated-user')
{

    function sleep() returns Boolean;
    //@readonly
    @Capabilities : { Insertable, Updatable: false, Deletable }
    entity EmployeeSet as projection on master.employees;
    @readonly
    entity AddressSet as projection on master.address;

    entity ProductSet as projection on master.product;

    entity BPSet as projection on master.businesspartner;

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }

    entity POItems @( title : '{i18n>poItems}' )
    as projection on transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

    entity POWorklist as projection on CDSViews.POWorklist;
    entity ProductOrders as projection on CDSViews.ProductViewSub;
    entity ProductAggregation as projection on CDSViews.CProductValuesView excluding{
        ProductId
    };

    entity PurchaseOrders as projection on CV_PURCHASE;
    entity PurchaseOrdersPerCustomer as projection on CV_PURCHASE_ORD;
}