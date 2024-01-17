-- CreateTable
CREATE TABLE "sys_supplier" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "contact" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_unit" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_brand" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sys_vehicle" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "plate_number" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "sys_vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_item" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "brand_id" TEXT,
    "unit_id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_canvass" (
    "id" TEXT NOT NULL,
    "rc_number" TEXT NOT NULL,
    "date_requested" TIMESTAMP(3) NOT NULL,
    "purpose" TEXT NOT NULL,
    "notes" TEXT,
    "requested_by_id" TEXT NOT NULL,
    "noted_by_id" TEXT NOT NULL,
    "is_referenced" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_canvass_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_canvass_item" (
    "id" TEXT NOT NULL,
    "canvass_id" TEXT NOT NULL,
    "item_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_canvass_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_supplier_item" (
    "id" TEXT NOT NULL,
    "item_id" TEXT NOT NULL,
    "supplier_id" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "is_awarded" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_supplier_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_job_order" (
    "id" TEXT NOT NULL,
    "jo_number" TEXT NOT NULL,
    "date_requested" TIMESTAMP(3) NOT NULL,
    "canvass_id" TEXT NOT NULL,
    "equipment" TEXT NOT NULL,
    "classification_id" TEXT,
    "department_id" TEXT NOT NULL,
    "supervisor_id" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "canceller_id" TEXT,
    "is_referenced" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_job_order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_jo_approver" (
    "id" TEXT NOT NULL,
    "jo_id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "date_approval" TIMESTAMP(3),
    "notes" TEXT,
    "status" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_jo_approver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_request_voucher" (
    "id" TEXT NOT NULL,
    "rv_number" TEXT NOT NULL,
    "date_requested" TIMESTAMP(3) NOT NULL,
    "canvass_id" TEXT NOT NULL,
    "work_order_no" TEXT,
    "work_order_date" TIMESTAMP(3),
    "classification_id" TEXT,
    "supervisor_id" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "canceller_id" TEXT,
    "is_referenced" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_request_voucher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_rv_approver" (
    "id" TEXT NOT NULL,
    "rv_id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "date_approval" TIMESTAMP(3),
    "notes" TEXT,
    "status" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_rv_approver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_spare_parts_request" (
    "id" TEXT NOT NULL,
    "spr_number" TEXT NOT NULL,
    "date_requested" TIMESTAMP(3) NOT NULL,
    "canvass_id" TEXT NOT NULL,
    "vehicle_id" TEXT NOT NULL,
    "classification_id" TEXT,
    "supervisor_id" TEXT NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "canceller_id" TEXT,
    "is_referenced" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_spare_parts_request_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_spr_approver" (
    "id" TEXT NOT NULL,
    "spr_id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "date_approval" TIMESTAMP(3),
    "notes" TEXT,
    "status" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_spr_approver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_material_equipment_quotation_summary" (
    "id" TEXT NOT NULL,
    "jo_id" TEXT,
    "rv_id" TEXT,
    "spr_id" TEXT,
    "meqs_number" TEXT NOT NULL,
    "request_type" INTEGER NOT NULL DEFAULT 1,
    "meqs_date" TIMESTAMP(3) NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "canceller_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_material_equipment_quotation_summary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_meqs_item" (
    "id" TEXT NOT NULL,
    "meqs_id" TEXT NOT NULL,
    "supplier_id" TEXT NOT NULL,
    "payment_terms" TEXT NOT NULL,
    "is_referenced" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_meqs_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_meqs_supplier_attachment" (
    "id" TEXT NOT NULL,
    "meqs_supplier_id" TEXT NOT NULL,
    "src" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_meqs_supplier_attachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_meqs_approver" (
    "id" TEXT NOT NULL,
    "meqs_id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "date_approval" TIMESTAMP(3),
    "notes" TEXT,
    "status" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_meqs_approver_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_purchase_order" (
    "id" TEXT NOT NULL,
    "meqs_supplier_id" TEXT NOT NULL,
    "po_number" TEXT NOT NULL,
    "po_date" TIMESTAMP(3) NOT NULL,
    "status" INTEGER NOT NULL DEFAULT 1,
    "canceller_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_purchase_order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ware_po_approver" (
    "id" TEXT NOT NULL,
    "po_id" TEXT NOT NULL,
    "approver_id" TEXT NOT NULL,
    "date_approval" TIMESTAMP(3),
    "notes" TEXT,
    "status" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ware_po_approver_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ware_canvass_rc_number_key" ON "ware_canvass"("rc_number");

-- CreateIndex
CREATE UNIQUE INDEX "ware_canvass_item_item_id_key" ON "ware_canvass_item"("item_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_job_order_jo_number_key" ON "ware_job_order"("jo_number");

-- CreateIndex
CREATE UNIQUE INDEX "ware_job_order_canvass_id_key" ON "ware_job_order"("canvass_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_request_voucher_rv_number_key" ON "ware_request_voucher"("rv_number");

-- CreateIndex
CREATE UNIQUE INDEX "ware_request_voucher_canvass_id_key" ON "ware_request_voucher"("canvass_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_spare_parts_request_spr_number_key" ON "ware_spare_parts_request"("spr_number");

-- CreateIndex
CREATE UNIQUE INDEX "ware_spare_parts_request_canvass_id_key" ON "ware_spare_parts_request"("canvass_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_material_equipment_quotation_summary_jo_id_key" ON "ware_material_equipment_quotation_summary"("jo_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_material_equipment_quotation_summary_rv_id_key" ON "ware_material_equipment_quotation_summary"("rv_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_material_equipment_quotation_summary_spr_id_key" ON "ware_material_equipment_quotation_summary"("spr_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_material_equipment_quotation_summary_meqs_number_key" ON "ware_material_equipment_quotation_summary"("meqs_number");

-- CreateIndex
CREATE UNIQUE INDEX "ware_purchase_order_meqs_supplier_id_key" ON "ware_purchase_order"("meqs_supplier_id");

-- CreateIndex
CREATE UNIQUE INDEX "ware_purchase_order_po_number_key" ON "ware_purchase_order"("po_number");

-- AddForeignKey
ALTER TABLE "ware_item" ADD CONSTRAINT "ware_item_brand_id_fkey" FOREIGN KEY ("brand_id") REFERENCES "sys_brand"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_item" ADD CONSTRAINT "ware_item_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "sys_unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_canvass_item" ADD CONSTRAINT "ware_canvass_item_canvass_id_fkey" FOREIGN KEY ("canvass_id") REFERENCES "ware_canvass"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_canvass_item" ADD CONSTRAINT "ware_canvass_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "ware_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_supplier_item" ADD CONSTRAINT "ware_supplier_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "ware_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_supplier_item" ADD CONSTRAINT "ware_supplier_item_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "sys_supplier"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_job_order" ADD CONSTRAINT "ware_job_order_canvass_id_fkey" FOREIGN KEY ("canvass_id") REFERENCES "ware_canvass"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_jo_approver" ADD CONSTRAINT "ware_jo_approver_jo_id_fkey" FOREIGN KEY ("jo_id") REFERENCES "ware_job_order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_request_voucher" ADD CONSTRAINT "ware_request_voucher_canvass_id_fkey" FOREIGN KEY ("canvass_id") REFERENCES "ware_canvass"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_rv_approver" ADD CONSTRAINT "ware_rv_approver_rv_id_fkey" FOREIGN KEY ("rv_id") REFERENCES "ware_request_voucher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_spare_parts_request" ADD CONSTRAINT "ware_spare_parts_request_canvass_id_fkey" FOREIGN KEY ("canvass_id") REFERENCES "ware_canvass"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_spare_parts_request" ADD CONSTRAINT "ware_spare_parts_request_vehicle_id_fkey" FOREIGN KEY ("vehicle_id") REFERENCES "sys_vehicle"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_spr_approver" ADD CONSTRAINT "ware_spr_approver_spr_id_fkey" FOREIGN KEY ("spr_id") REFERENCES "ware_spare_parts_request"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_material_equipment_quotation_summary" ADD CONSTRAINT "ware_material_equipment_quotation_summary_jo_id_fkey" FOREIGN KEY ("jo_id") REFERENCES "ware_job_order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_material_equipment_quotation_summary" ADD CONSTRAINT "ware_material_equipment_quotation_summary_rv_id_fkey" FOREIGN KEY ("rv_id") REFERENCES "ware_request_voucher"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_material_equipment_quotation_summary" ADD CONSTRAINT "ware_material_equipment_quotation_summary_spr_id_fkey" FOREIGN KEY ("spr_id") REFERENCES "ware_spare_parts_request"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_meqs_item" ADD CONSTRAINT "ware_meqs_item_meqs_id_fkey" FOREIGN KEY ("meqs_id") REFERENCES "ware_material_equipment_quotation_summary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_meqs_item" ADD CONSTRAINT "ware_meqs_item_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "sys_supplier"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_meqs_supplier_attachment" ADD CONSTRAINT "ware_meqs_supplier_attachment_meqs_supplier_id_fkey" FOREIGN KEY ("meqs_supplier_id") REFERENCES "ware_meqs_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_meqs_approver" ADD CONSTRAINT "ware_meqs_approver_meqs_id_fkey" FOREIGN KEY ("meqs_id") REFERENCES "ware_material_equipment_quotation_summary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_purchase_order" ADD CONSTRAINT "ware_purchase_order_meqs_supplier_id_fkey" FOREIGN KEY ("meqs_supplier_id") REFERENCES "ware_meqs_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ware_po_approver" ADD CONSTRAINT "ware_po_approver_po_id_fkey" FOREIGN KEY ("po_id") REFERENCES "ware_purchase_order"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
