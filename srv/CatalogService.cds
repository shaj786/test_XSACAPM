using { shaj.db.master, shaj.db.transaction, shaj.db.CDSViews, CV_PURCHASE } from '../db/datamodel';


service CatalogService@(path:'/CatalogService') {

    function sleep() returns Boolean;

    entity EmployeeSet as projection on master.employees;

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

}