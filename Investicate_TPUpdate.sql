--Sale Report

Select	
PV.ID PVID, PV.Name ProductName,
Count(PV.ID) SaleQuantity


From ThingRequest TR
Join	ProductVariant PV on pv.id=tr.ProductVariantId
Join	Shipment S on S.id=Tr.ShipmentId
join	Thing t on tr.AssignedThingId=t.id

where s.ReconciledOn is not null
and s.reconciledon >= '2022-03-04 17:41 +6:00'
and s.reconciledon < '2022-06-12 23:00 +6:00'
and tr.IsCancelled = 0
and	tr.IsReturned = 0
and	tr.IsMissingAfterDispatch = 0
and	tr.HasFailedBeforeDispatch = 0
and	s.ShipmentStatus not in (1,9,10)
and tr.ProductVariantId=2334
and T.CostPrice > 530
and t.PurchaseOrderId is not null
and t.mrp = 560

Group By PV.ID, PV.Name
