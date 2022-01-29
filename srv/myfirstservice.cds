using { shaj.db.master } from '../db/datamodel';
service mysrv {
  function hello (to:String) returns String;

  @readonly
  entity ReadEmployeeSrv as projection on master.employees;
  
  entity InsertEmployeeSrv as projection on master.employees;

    entity UpdateEmployeeSrv as projection on master.employees;

    entity DeleteEmployeeSrv as projection on master.employees;
}